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
    
    var currentDataSource: [String: String]? {
        didSet {
            if let dataSource = currentDataSource {
                iconButton.image = NSImage(named: dataSource["image"]!)
            }
        }
    }
    
    
    var delegate: CollectionViewItemDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        iconButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(24)
            make.center.equalTo(self.view)
        }
        iconButton.imageScaling = .scaleAxesIndependently
        iconButton.wantsLayer = true
        iconButton.layer?.backgroundColor = NSColor.clear.cgColor
        iconButton.isBordered = false
        iconButton.bezelStyle = .circular
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
