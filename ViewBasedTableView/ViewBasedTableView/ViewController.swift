//
//  ViewController.swift
//  ViewBasedTableView
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var tableView: NSTableView?
    var dataSource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let currentCell = CurrentCell(frame: NSRect(x: 100, y: 100, width: 200, height: 100))
//        currentCell.title = "北京四中网校"
//        self.view.addSubview(currentCell)
//
//        return
        for i in 0..<20 {
            dataSource.append("第\(i)行数据")
        }
        
        
        let scrollView = NSScrollView(frame: self.view.bounds)
        scrollView.backgroundColor = NSColor.green
        self.view.addSubview(scrollView)
        
        self.tableView = NSTableView(frame: scrollView.bounds)
        tableView?.delegate = self
        tableView?.dataSource = self
        let tableViewColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "test"))
        // 设置列宽
        //tableViewColumn.width = 30.0
        tableViewColumn.title = "第1列"
        tableView?.addTableColumn(tableViewColumn)
        
        let tableViewColumn2 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "test2"))
        // 设置列宽
        //tableViewColumn2.width = 300.0
        tableViewColumn2.title = "第2列"
        tableView?.addTableColumn(tableViewColumn2)
        scrollView.contentView.documentView = tableView
        tableView?.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    // 设置行数
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.count
    }
    
    // 设置某个元素的具体视图
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        print("当前column:\(tableColumn?.title)")
//        var view = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
//        if view == nil {
//            view = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 30))
//            view?.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
//        }
//        (view as! NSTextField).stringValue = dataSource[row]
//        return view
        
        var currentCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "currentCell"), owner: self)
        if currentCell == nil {
            currentCell = CurrentCell(frame: NSRect(x: 0, y: 0, width: 150, height: 50))
            currentCell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "currentCell")
        }
        (currentCell as! CurrentCell).title = dataSource[row]
        return currentCell
    }
    
    // 设置每行容器视图
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return NSTableRowView()
    }
    
    // 当添加行时调用的回调
    func tableView(_ tableView: NSTableView, didAdd rowView: NSTableRowView, forRow row: Int) {
        print("add")
    }
    
    // 移除行的回调
    func tableView(_ tableView: NSTableView, didRemove rowView: NSTableRowView, forRow row: Int) {
        print("remove")
    }
    
    // 设置行高
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 50
    }
    
}

class CurrentCell: NSView {
    
    var textField: NSTextField?
    
    
    var title:String? {
        didSet {
            print("当前标题:\(title)")
            textField!.stringValue = title!
        }
    }
    
    override func layout() {
        super.layout()
        textField?.frame = NSRect(x: 0, y: 0, width: 100, height: 30)
    }
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void {
        textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 30))
        textField?.isEditable = false
        self.addSubview(textField!)
    }
}
