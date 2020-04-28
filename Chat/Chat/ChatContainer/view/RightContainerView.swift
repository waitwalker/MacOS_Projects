//
//  RightContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import Alamofire

/*
 * name: RightContainerView
 * description: 聊天页面右边容器
 * author: waitwalker
 * date: 4.28
 */
class RightContainerView: NSView {
    var titleLabel: NSTextField!
    var rightArrowImageView: NSImageView!
    var publishContentLabel: NSTextField!
    
    var mContainerView: NSView!
    var userCountLabel: NSTextField!
    var searchImageView: NSImageView!
    
    var bContainerView: NSView!
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    var dataSource: RecentChatListModel = RecentChatListModel()
    
    
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor(red: 244 / 255.0, green: 246 / 255.0, blue: 248 / 255.0, alpha: 1.0).cgColor
        setupSubviews()
        setupDataSource()
    }
    
    // 初始化子控件
    private func setupSubviews() -> Void {
        titleLabel = NSTextField()
        titleLabel.isEditable = false
        titleLabel.backgroundColor = NSColor.clear
        titleLabel.textColor = NSColor.black
        titleLabel.isBordered = false
        titleLabel.isBezeled = false
        titleLabel.stringValue = "群公告"
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        rightArrowImageView = NSImageView(image: NSImage(named: "right_arrow")!)
        self.addSubview(rightArrowImageView)
        
        rightArrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.height.width.equalTo(16)
            make.top.equalTo(10)
        }
        
        publishContentLabel = NSTextField()
        publishContentLabel.stringValue = "当一个人，没有业绩的时候，他准备放弃了！他会对身边的人说：这个市场不行，这个行业不行，这个领导不行，公司也不行，我不干了！\n当一个人每月都能做很多业绩，拿到很多收入，他会告诉你：市场挺好的，只要努力点、勤奋点，赚钱很容易，咱们多交流，一起好好干！\n你相信谁，你就成为谁！我们下意识的偏向谁，就将成为谁！\n与高人同行，与智者为伍。\n——永远不要相信失败者那张嘴。"
        publishContentLabel.isEditable = false
        publishContentLabel.backgroundColor = NSColor.clear
        publishContentLabel.textColor = NSColor.black
        publishContentLabel.isBordered = false
        publishContentLabel.isBezeled = false
        self.addSubview(publishContentLabel)
        
        publishContentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(40)
            make.right.equalTo(-10)
        }
        
        mContainerView = NSView()
        mContainerView.wantsLayer = true
        mContainerView.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.2).cgColor
        self.addSubview(mContainerView)
        mContainerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.center.equalTo(self)
            make.height.equalTo(40)
        }
        
        userCountLabel = NSTextField()
        userCountLabel.isEditable = false
        userCountLabel.backgroundColor = NSColor.clear
        userCountLabel.textColor = NSColor.black
        userCountLabel.isBordered = false
        userCountLabel.isBezeled = false
        userCountLabel.stringValue = "成员  280/500"
        mContainerView.addSubview(userCountLabel)
        
        userCountLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.width.equalTo(100)
        }
        
        searchImageView = NSImageView(image: NSImage(named: "user_search")!)
        mContainerView.addSubview(searchImageView)
        
        searchImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.height.width.equalTo(16)
            make.top.equalTo(10)
        }
        
        bContainerView = NSView(frame: NSRect(x: 0, y: 0, width: self.bounds.width, height: 305))
        bContainerView.wantsLayer = true
        bContainerView.layer?.backgroundColor = NSColor.yellow.withAlphaComponent(0.2).cgColor
        self.addSubview(bContainerView)
        
        scrollView = NSScrollView(frame: bContainerView.bounds)
        scrollView.backgroundColor = NSColor.green
        bContainerView.addSubview(scrollView)
        
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
    
    /*
     * name: setupDataSource
     * description: 初始化数据源
     * author: waitwalker
     * date: 4.26
     */
    private func setupDataSource() -> Void {
        AF.request("http://0.0.0.0:7300/mock/5ea0f178bf88582b7376c7a3/api/userList#!method=get", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}

/*
 * name:
 * description: table view 代理 && 数据源
 * author: waitwalker
 * date: 4.24
 */
extension RightContainerView: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.data == nil ? 0 : (dataSource.data?.count)!
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
        if cell == nil {
            cell = UserItemCell(frame: NSRect(x: 0, y: 0, width:960, height: 60))
            cell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
        }
        (cell as! UserItemCell).currentData = dataSource.data?[row]
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return UserTableRowView()
    }
    
    func tableView(_ tableView: NSTableView, shouldTrackCell cell: NSCell, for tableColumn: NSTableColumn?, row: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return true
    }
}

/*
 * name: UserItemCell
 * description: 最近聊天列表 cell 封装
 * author: waitwalker
 * date: 4.24
 */
class UserItemCell: NSView {
    
    var headerImageView: NSImageView!
    var nameLabel: NSTextField!
    var adminImageView: NSImageView!
    
    var currentData: RecentChatItemModel? {
        didSet {
            if let model = currentData {
                nameLabel.stringValue = model.user_name
                headerImageView.image = NSImage(named: model.header)
                if model.admin == 0 {
                    adminImageView.isHidden = true
                } else {
                    adminImageView.isHidden = false
                    if model.admin == 1 {
                        adminImageView.image = NSImage(named: "admin_1")!
                    } else {
                        adminImageView.image = NSImage(named: "admin_2")!
                    }
                }
            }
        }
    }
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    private func setupSubviews() -> Void {
        headerImageView = NSImageView()
        headerImageView.image = NSImage(named: "add_new_chat")
        headerImageView.wantsLayer = true
        headerImageView.layer?.cornerRadius = 10
        self.addSubview(headerImageView)
        
        headerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.height.width.equalTo(20)
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
        
        adminImageView = NSImageView()
        adminImageView.wantsLayer = true
        self.addSubview(adminImageView)
        
        adminImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.height.width.equalTo(10)
            make.centerY.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

/*
 * name: UserTableRowView
 * description: cell 选中背景色重写
 * author: waitwalker
 * date: 4.24
 */
class UserTableRowView: NSTableRowView {
    override func drawSelection(in dirtyRect: NSRect) {
        if self.selectionHighlightStyle != .none {
            let selectRect = NSInsetRect(self.bounds, 0, 0)
            NSColor.gray.withAlphaComponent(0.2).setFill()
            let selectionPath = NSBezierPath(roundedRect: selectRect, xRadius: 0, yRadius: 0)
            selectionPath.fill()
        }
    }
}
