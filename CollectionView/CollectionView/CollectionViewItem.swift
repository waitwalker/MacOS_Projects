//
//  CollectionViewItem.swift
//  CollectionView
//
//  Created by etiantian on 2020/3/30.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    
    
    @IBOutlet weak var nameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    var name:String? {
        didSet {
            let nameString = self.name!
            self.nameLabel.stringValue = nameString
        }
    }
    
    
}
