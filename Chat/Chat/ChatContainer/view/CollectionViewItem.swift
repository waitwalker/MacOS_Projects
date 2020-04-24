//
//  CollectionViewItem.swift
//  Chat
//
//  Created by etiantian on 2020/4/24.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.green.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
