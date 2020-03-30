//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by etiantian on 2020/3/30.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

let kReusedItemId:String = "kReusedItemId"


class ViewController: NSViewController {
    
    var collectionView:NSCollectionView!
    var dataSource:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionLayout:NSCollectionViewFlowLayout = NSCollectionViewFlowLayout()
        
        collectionView = NSCollectionView(frame: self.view.bounds)
        collectionView.register(MTTCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: kReusedItemId))
        collectionView.collectionViewLayout = collectionLayout
        self.view.addSubview(collectionView)
        
        dataSource = [
            ["title":"二中"],
            ["title":"三中"],
            ["title":"四中"],
            ["title":"五中"],
            ["title":"八中"],
            ["title":"九中"],
        ]
        collectionView.reloadData()
        
    }
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController:NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: kReusedItemId), for: indexPath) as! MTTCollectionViewItem
        let dict:[String:String] = dataSource[indexPath.item]
        item.name = dict["title"]
        return item
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
}

class MTTCollectionViewItem: NSCollectionViewItem {
    
    var name:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label:NSTextField = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        label.stringValue = name
        label.textColor = NSColor.red
        label.isEditable = false
        self.view.addSubview(label)
        
    }
}

