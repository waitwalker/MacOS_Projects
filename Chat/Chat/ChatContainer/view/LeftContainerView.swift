//
//  LeftContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import Alamofire

/*
 * name: LeftContainerView
 * description: 左边的容器
 * author: waitwalker
 * date: 4.24
 */
class LeftContainerView: NSView {
    
    // 滚动容器
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    
    var dataSource: RecentChatListModel = RecentChatListModel()
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
        setupDataSource()
    }
    
    func setupDataSource() -> Void {
        AF.request("http://0.0.0.0:7300/mock/5ea0f178bf88582b7376c7a3/api/recentChatList#!method=get", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil
            , requestModifier: nil).responseJSON { (response) in
                print("response:\(response)")
                switch response.result {
                case .success(let json):
                    print("json:\(json)")
                    self.dataSource = RecentChatListModel.deserialize(from: (json as! Dictionary))!
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    break
                case .failure(let error):
                    print("recent chat list error:\(error)")
                    break
                }
        }
    }
    
    func setupSubviews() -> Void {
        scrollView = NSScrollView(frame: self.bounds)
        scrollView.backgroundColor = NSColor.white
        scrollView.hasVerticalScroller = true
        self.addSubview(scrollView)
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(rawValue: "chat_column"))
        column.title = "最近聊天"
        column.width = self.frame.width
        tableView = NSTableView(frame: scrollView.frame)
        tableView.addTableColumn(column)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = NSColor.white
        // 去掉header
        tableView.headerView = nil
        scrollView.documentView = tableView
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}

/*
 * name:
 * description: table view 代理 && 数据源
 * author: waitwalker
 * date: 4.24
 */
extension LeftContainerView: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.data == nil ? 0 : (dataSource.data?.count)!
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
        if cell == nil {
            cell = RecentChatItemCell(frame: NSRect(x: 0, y: 0, width:960, height: 60))
            cell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
        }
        (cell as! RecentChatItemCell).currentData = dataSource.data?[row]
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return TableRowView()
    }
    
}

/*
 * name: RecentChatItemCell
 * description: 最近聊天列表 cell 封装
 * author: waitwalker
 * date: 4.24
 */
class RecentChatItemCell: NSView {
    
    var headerImageView: NSImageView!
    var nameLabel: NSTextField!
    var timeLabel: NSTextField!
    var recentLabel: NSTextField!
    var unreadLabel: NSTextField!
    
    
    var currentData: RecentChatItemModel? {
        didSet {
            nameLabel.stringValue = (currentData?.user_name)!
            timeLabel.stringValue = (currentData?.last_chat_time)!
            recentLabel.stringValue = (currentData?.last_message)!
            unreadLabel.stringValue = ("\(currentData?.unread_message_count ?? 0)")
            headerImageView.image = NSImage(named: "\(currentData?.header ?? "header_0")")
        }
    }
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        headerImageView = NSImageView()
        headerImageView.image = NSImage(named: "add_new_chat")
        headerImageView.wantsLayer = true
        headerImageView.layer?.cornerRadius = 20
        self.addSubview(headerImageView)
        
        headerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.height.width.equalTo(40)
            make.centerY.equalTo(self)
        }
        
        nameLabel = NSTextField()
        nameLabel.isEditable = false
        nameLabel.textColor = NSColor.black
        nameLabel.backgroundColor = NSColor.clear
        nameLabel.font = NSFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.isBordered = false
        nameLabel.isBezeled = false
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImageView.snp.right).offset(10)
            make.top.equalTo(headerImageView.snp.top)
        }
        
        timeLabel = NSTextField()
        timeLabel.isEditable = false
        timeLabel.textColor = NSColor.gray
        timeLabel.backgroundColor = NSColor.clear
        timeLabel.isBordered = false
        timeLabel.isBezeled = false
        timeLabel.font = NSFont.systemFont(ofSize: 10)
        timeLabel.alignment = NSTextAlignment.right
        self.addSubview(timeLabel)
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel)
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(70)
        }
        
        recentLabel = NSTextField()
        recentLabel.isEditable = false
        recentLabel.textColor = NSColor.black
        recentLabel.font = NSFont.systemFont(ofSize: 10)
        recentLabel.backgroundColor = NSColor.clear
        recentLabel.maximumNumberOfLines = 1
        recentLabel.isBordered = false
        recentLabel.isBezeled = false
        recentLabel.sizeToFit()
        self.addSubview(recentLabel)
        recentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImageView.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.width.equalTo(160)
        }
        
        unreadLabel = NSTextField()
        unreadLabel.isEditable = false
        unreadLabel.textColor = NSColor.black
        unreadLabel.wantsLayer = true
        unreadLabel.layer?.cornerRadius = 10.0
        unreadLabel.backgroundColor = NSColor.gray.withAlphaComponent(0.1)
        unreadLabel.isBordered = false
        unreadLabel.isBezeled = false
        unreadLabel.font = NSFont.systemFont(ofSize: 9)
        unreadLabel.alignment = NSTextAlignment.center
        self.addSubview(unreadLabel)
        
        unreadLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.width.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

/*
 * name: TableRowView
 * description: cell 选中背景色重写
 * author: waitwalker
 * date: 4.24
 */
class TableRowView: NSTableRowView {
    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectRect = NSInsetRect(self.bounds, 0, 0)
            NSColor.gray.withAlphaComponent(0.2).setFill()
            let selectionPath = NSBezierPath(roundedRect: selectRect, xRadius: 0, yRadius: 0)
            selectionPath.fill()
        }
    }
}
