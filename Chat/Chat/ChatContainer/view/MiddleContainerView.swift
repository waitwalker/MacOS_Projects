//
//  MiddleContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

extension NSUserInterfaceItemIdentifier {
    static let reusedMiddleItemId = NSUserInterfaceItemIdentifier(rawValue: "reusedMiddleItemId")
}

class MiddleContainerView: NSView {

    var leftBorder: NSView!
    var rightBorder: NSView!
    var topContainerView: NSView!
    var nameLabel: NSTextField!
    var addGroupUserButton: NSButton!
    var foldButton: NSButton!
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    var bottomContainerView: NSView!
    
    var containerScrollView: NSScrollView!
    var bottomCollectionView: NSCollectionView!
    
    

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void {
        leftBorder = NSView(frame: NSRect(x: 0, y: 0, width: 0.5, height: self.frame.height))
        leftBorder.wantsLayer = true
        leftBorder.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(leftBorder)
        
        rightBorder = NSView(frame: NSRect(x: self.frame.width - 1, y: 0, width: 0.5, height: self.frame.height))
        rightBorder.wantsLayer = true
        rightBorder.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(rightBorder)
        
        topContainerView = NSView(frame: NSRect(x: 2, y: 600, width: self.frame.width - 4, height: 60))
        topContainerView.wantsLayer = true
        topContainerView.layer?.backgroundColor = NSColor.red.cgColor
        self.addSubview(topContainerView)
        
        nameLabel = NSTextField(frame: NSRect(x: 10, y: 10, width: 150, height: 40))
        nameLabel.stringValue = "python && Golang"
        nameLabel.isEditable = false
        nameLabel.textColor = NSColor.black
        nameLabel.backgroundColor = NSColor.white
        nameLabel.font = NSFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.isBordered = false
        nameLabel.isBezeled = false
        topContainerView.addSubview(nameLabel)
        
        foldButton = NSButton(image: NSImage(named: "add_new_chat")!, target: self, action: #selector(foldButtonAction))
        foldButton.frame = NSRect(x: self.frame.width - 50, y: 10, width: 40, height: 40)
        topContainerView.addSubview(foldButton)
        
        addGroupUserButton = NSButton(image: NSImage(named: "add_new_chat")!, target: self, action: #selector(addGroupUserButtonAction))
        addGroupUserButton.frame = NSRect(x: self.frame.width - 100, y: 10, width: 40, height: 40)
        topContainerView.addSubview(addGroupUserButton)
        
        scrollView = NSScrollView(frame: NSRect(x: 2, y: 200, width: self.frame.width - 4, height: 400))
        scrollView.backgroundColor = NSColor.yellow
        scrollView.hasVerticalScroller = true
        self.addSubview(scrollView)
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(rawValue: "chat_column"))
        column.title = "最近聊天"
        column.width = self.frame.width
        tableView = NSTableView(frame: scrollView.bounds)
        tableView.addTableColumn(column)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = NSColor.white
        // 去掉header
        tableView.headerView = nil
        scrollView.documentView = tableView
        tableView.reloadData()
        
        bottomContainerView = NSView(frame: NSRect(x: 2, y: 150, width: self.frame.width - 4, height: 60))
        bottomContainerView.wantsLayer = true
        bottomContainerView.layer?.backgroundColor = NSColor.red.cgColor
        self.addSubview(bottomContainerView)
        
        containerScrollView = NSScrollView(frame: bottomContainerView.bounds)
        containerScrollView.backgroundColor = NSColor.yellow
        bottomContainerView.addSubview(containerScrollView)
        
        let flowLayOut = NSCollectionViewFlowLayout()
        //flowLayOut.itemSize = CGSize(width: 40, height: 40)
        flowLayOut.minimumLineSpacing = 10
        flowLayOut.minimumInteritemSpacing = 10
        flowLayOut.scrollDirection = .horizontal
        bottomCollectionView = NSCollectionView(frame: containerScrollView.bounds)
        bottomCollectionView.backgroundColors = [NSColor.white]
        bottomCollectionView.collectionViewLayout = flowLayOut
        containerScrollView.documentView = bottomCollectionView
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.register(CollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "UserCollectionViewItem"))
    }
    
    @objc func foldButtonAction() -> Void {
        
    }
    
    @objc func addGroupUserButtonAction() -> Void {
        
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    
}

extension MiddleContainerView: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 20
        //return dataSource.data == nil ? 0 : (dataSource.data?.count)!
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
        if cell == nil {
            cell = NSTextField(frame: NSRect(x: 0, y: 0, width:900, height: 60))
            cell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
        }
        (cell as! NSTextField).stringValue = "第\(row)行"
        (cell as! NSTextField).textColor = NSColor.white
        return cell
//        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cellId"), owner: self)
//        if cell == nil {
//            cell = ChatCell(frame: NSRect(x: 0, y: 0, width:900, height: 60))
//            cell!.identifier = NSUserInterfaceItemIdentifier(rawValue: "cellId")
//        }
//        (cell as! ChatCell).currentData = dataSource.data?[row]
//        return cell
    }
    
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 60
    }
    
}

extension MiddleContainerView: NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "UserCollectionViewItem"), for: indexPath)
        return item
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 30, height: 30)
    }
}

