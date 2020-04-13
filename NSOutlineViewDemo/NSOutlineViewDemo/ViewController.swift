//
//  ViewController.swift
//  NSOutlineViewDemo
//
//  Created by etiantian on 2020/4/10.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var treeView: NSOutlineView!
    
    @IBOutlet weak var textField: NSTextField!
    
    
    var treeNode: TreeNodeModel = TreeNodeModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configData()
    }
    
    func configData() -> Void {
        let rootNode = TreeNodeModel()
        rootNode.name = "网易"
        
        let rootNode2 = TreeNodeModel()
        rootNode2.name = "腾讯"
        
        self.treeNode.childNodes.append(rootNode)
        self.treeNode.childNodes.append(rootNode2)
        
        
        let level11Node = TreeNodeModel()
        level11Node.name = "电商"
        
        let level12Node = TreeNodeModel()
        level12Node.name = "游戏"
        
        let level13Node = TreeNodeModel()
        level13Node.name = "音乐"
        
        rootNode.childNodes.append(level11Node)
        rootNode.childNodes.append(level12Node)
        rootNode.childNodes.append(level13Node)
        
        rootNode2.childNodes.append(level13Node)
        
        
        let level21Node = TreeNodeModel()
        level21Node.name = "研发"
        
        let level22Node = TreeNodeModel()
        level22Node.name = "运营"
        
        level11Node.childNodes.append(level21Node)
        level11Node.childNodes.append(level22Node)
        
        
        self.treeView.reloadData()
        
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSOutlineViewDelegate {
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let view = outlineView.makeView(withIdentifier: tableColumn!.identifier, owner: self)
        let subviews = view?.subviews
        let field = subviews![0] as! NSTextField 
        let model = item as! TreeNodeModel
        field.stringValue = model.name!
        if model.childNodes.count <= 0 {
            
        }
        return view
    }
    
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 40
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        let treeView = notification.object as! NSOutlineView
        let row = treeView.selectedRow
        let model = treeView.item(atRow: row)
        let p = treeView.parent(forItem: model)
        print("model:\(model)")
        print("p:\(p)")
    }
}

extension ViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        let rootNode:TreeNodeModel
        if item != nil {
            rootNode = item as! TreeNodeModel
        } else {
            rootNode = self.treeNode
        }
        return rootNode.childNodes.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        let rootNode:TreeNodeModel
        if item != nil {
            rootNode = item as! TreeNodeModel
        } else {
            rootNode = self.treeNode
        }
        return rootNode.childNodes[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        let rootNode:TreeNodeModel = item as! TreeNodeModel
        return rootNode.childNodes.count > 0
    }
}

