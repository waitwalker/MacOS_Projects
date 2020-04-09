//
//  ViewController.swift
//  NSTableViewDemo
//
//  Created by etiantian on 2020/4/9.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    var datas = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        
    }
    
    func tableViewConfig() -> Void {
        // 设置tableView 横竖网格线
        self.tableView.gridStyleMask = [NSTableView.GridLineStyle.dashedHorizontalGridLineMask,NSTableView.GridLineStyle.solidVerticalGridLineMask]
        // tableView 背景颜色
        self.tableView.backgroundColor = .blue
        // 背景颜色交替
        self.tableView.usesAlternatingRowBackgroundColors = true
        // 表格行选中样式
        self.tableView.selectionHighlightStyle = .sourceList
    }
    
    func updateData() -> Void {
        self.datas = [
            ["name":"john","address":"USA","gender":"male","married":(1)],
            ["name":"mary","address":"China","gender":"female","married":(0)],
            ["name":"park","address":"Japan","gender":"male","married":(0)],
            ["name":"Daba","address":"Russia","gender":"female","married":(1)],
        ]
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.datas.count
    }
    
    // 获取数据源 更新视图 get
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        // 获取当前行数据
        let data = self.datas[row]
        
        // 表格列的标识
        let key = tableColumn?.identifier
        
        // 单元格数据
        let value = data[key!]
        
        return value
    }
    
    // 设置数据源 更新数据
    func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        
        // 当前行数据
        let data = self.datas[row]
        
        // 表格列的标识
        let key = tableColumn?.identifier
        
        let editData = NSMutableDictionary(dictionary: data)
        
        editData[key!] = object
        
        self.datas[row] = editData
    }
}

