//
//  ViewController.swift
//  TableViewDemo
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa


/// 基于 cell-based TableView
class ViewController: NSViewController {

    var tableView: NSTableView?
    var dataSource: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    // 返回行数
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.count
    }
    
    // 绑定数据
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return dataSource[row]
    }
    
    // 编辑当前行数据
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        print("编辑后的数据:\(object)")
        self.dataSource[row] = object as! String
    }
    
    // 是否可以编辑
    func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
        return false
    }
    
    // 鼠标浮上去的提示
    func tableView(_ tableView: NSTableView, toolTipFor cell: NSCell, rect: NSRectPointer, tableColumn: NSTableColumn?, row: Int, mouseLocation: NSPoint) -> String {
        return "当前tip"
    }
    
    // 当列表长度不够时,鼠标悬停是否扩展显示
    func tableView(_ tableView: NSTableView, shouldShowCellExpansionFor tableColumn: NSTableColumn?, row: Int) -> Bool {
        return true
    }
    
    // 设置cell的交互能力
    func tableView(_ tableView: NSTableView, shouldTrackCell cell: NSCell, for tableColumn: NSTableColumn?, row: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: NSTableView, dataCellFor tableColumn: NSTableColumn?, row: Int) -> NSCell? {
        return NSCell(textCell: dataSource[row])
    }
}

