//
//  LeftContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class LeftContainerView: NSView {
    
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    
    var dataSource: [[String: Any]] = []
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    func setupDataSource() -> Void {
        
    }
    
    func setupSubviews() -> Void {
        scrollView = NSScrollView()
        scrollView.backgroundColor = NSColor.yellow
        scrollView.hasVerticalScroller = true
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self)
        }
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(rawValue: "chat_column"))
        column.title = "最近聊天"
        tableView = NSTableView()
        tableView.addTableColumn(column)
        tableView.delegate = self
        tableView.dataSource = self
        scrollView.documentView = tableView
        
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(scrollView)
        }
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
        return dataSource.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
        if cell == nil {
            cell = ChatCell(frame: NSRect(x: 0, y: 0, width: 270, height: 70))
            cell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
        }
        (cell as! ChatCell).currentData = dataSource[row]
        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 70
    }
    
}

class ChatCell: NSView {
    
    
    
    var currentData: [String: Any]? {
        didSet {
            
        }
    }
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
