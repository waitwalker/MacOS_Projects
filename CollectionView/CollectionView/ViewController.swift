//
//  ViewController.swift
//  CollectionView
//
//  Created by etiantian on 2020/3/30.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

extension NSUserInterfaceItemIdentifier {
    static let collectionViewItem = NSUserInterfaceItemIdentifier("CollectionViewItem")
}





class ViewController: NSViewController {
    
    var content = [NSDictionary]()
    
    lazy var scrollView: NSScrollView = {
        let scrollView = NSScrollView()
        scrollView.focusRingType = .none
        scrollView.autohidesScrollers = true
        scrollView.borderType = .noBorder
        scrollView.contentView = self.clipView
        return scrollView
    }()
    
    lazy var clipView:NSClipView = {
        let clip = NSClipView()
        clip.documentView = self.collectionView
        return clip
    }()
    
    lazy var collectionView: NSCollectionView = {
        let view = NSCollectionView()
        view.isSelectable = true
        view.delegate     = self
        view.dataSource   = self
        view.collectionViewLayout = self.flowLayout
        view.register(CollectionViewItem.self, forItemWithIdentifier: .collectionViewItem)
        //view.backgroundColors[0] = NSColor.red
        return view
    }()
    
    var sectionInset: NSEdgeInsets = NSEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    lazy var flowLayout: NSCollectionViewFlowLayout = {
        let layout = NSCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = self.sectionInset
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.frame = self.view.bounds
        clipView.frame = self.view.bounds
        
        scrollView.frame = self.view.bounds
        self.view.addSubview(scrollView)
        self.updateContent()
        
       let dd = NSCollectionViewGridLayout()
    }

    func updateContent(){
        
        let item1: NSDictionary = ["name" : "computer"]
        
        let item2: NSDictionary = ["name" : "folder"]
        
        let item3: NSDictionary = ["name" : "home",]
        
        let item4: NSDictionary = ["name" : "list"]
        
        let item5: NSDictionary = ["name" : "network"]
        
        let item6: NSDictionary = ["name" : "share"]
        
        content.append(item1)
        content.append(item2)
        content.append(item3)
        content.append(item4)
        content.append(item5)
        content.append(item6)
       
        
        collectionView.reloadData()
        
        if let contentSize = self.collectionView.collectionViewLayout?.collectionViewContentSize {
          self.collectionView.setFrameSize(contentSize)
        }
        
        
        
    }
}

extension ViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        //let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CollectionViewItem"), for: indexPath)
        
        let item = collectionView.makeItem(withIdentifier: .collectionViewItem, for: indexPath) as! CollectionViewItem
        
        let itemIndex = (indexPath as NSIndexPath).item
        item.name = "\(indexPath.item)"
        return item
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
}

extension ViewController: NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        
        print(indexPaths)
    }
}



extension ViewController: NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 100, height: 100)
    }
    
    
}




class MTTCollectionViewItem: NSCollectionViewItem {
    
    var name:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label:NSTextField = NSTextField(frame: NSRect(x: 50, y: 50, width: 100, height: 100))
        label.stringValue = name
        label.isEditable = false
        self.view.addSubview(label)
        
    }
}

