//
//  CollectionViewItem.swift
//  Chat
//
//  Created by etiantian on 2020/4/24.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {
    @IBOutlet weak var iconButton: NSButton!
    
    var currentIndexPath: IndexPath? {
        didSet {
            
        }
    }
    var delegate: CollectionViewItemDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.green.cgColor
    }
    
    @IBAction func iconButtonAction(_ sender: NSButton) {
        self.delegate?.didSelect(self.currentIndexPath)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

protocol CollectionViewItemDelegate {
    func didSelect(_ indexPath: IndexPath?) -> Void
}
