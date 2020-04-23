//
//  LeftContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import Alamofire

class LeftContainerView: NSView {
    
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    
    var dataSource: RecectChatListModel = RecectChatListModel()
    
    
    
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
                    self.dataSource = RecectChatListModel.deserialize(from: (json as! Dictionary))!
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
        scrollView.backgroundColor = NSColor.yellow
        scrollView.hasVerticalScroller = true
        self.addSubview(scrollView)
        
//        scrollView.snp.makeConstraints { (make) in
//            make.left.right.top.equalTo(self)
//            make.height.equalTo(650)
//        }
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(rawValue: "chat_column"))
        column.title = "最近聊天"
        tableView = NSTableView(frame: scrollView.bounds)
        tableView.addTableColumn(column)
        tableView.delegate = self
        tableView.dataSource = self
        // 去掉header
        tableView.headerView = nil
        scrollView.documentView = tableView
        
//        tableView.snp.makeConstraints { (make) in
//            make.left.right.top.bottom.equalTo(self)
//        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}

extension LeftContainerView: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.data == nil ? 0 : (dataSource.data?.count)!
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
        if cell == nil {
            cell = ChatCell(frame: NSRect(x: 0, y: 0, width: 270, height: 60))
            cell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
        }
        (cell as! ChatCell).currentData = dataSource.data?[row]
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 60
    }
    
}

class ChatCell: NSView {
    
    
    var headerImageView: NSImageView!
    
    var nameLabel: NSTextField!
    
    
    var currentData: RecectChatItemModel? {
        didSet {
            
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
