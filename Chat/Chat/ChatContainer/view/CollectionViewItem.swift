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
    
    var popOver: NSPopover!
    
    
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
        setupTrackingArea()
    }
    
    @IBAction func iconButtonAction(_ sender: NSButton) {
        self.delegate?.didSelect(self.currentIndexPath)
    }
    
    /*
     * name: setupTrackingArea
     * description: 设置tracking area
     * author: waitwalker
     * date: 4.27
     */
    private func setupTrackingArea() -> Void {
        let trackingArea = NSTrackingArea(rect: self.view.bounds, options: [NSTrackingArea.Options.mouseMoved,NSTrackingArea.Options.mouseEnteredAndExited,NSTrackingArea.Options.activeInKeyWindow], owner: self, userInfo: nil)
        self.view.addTrackingArea(trackingArea)
    }
    
    
    override func mouseEntered(with event: NSEvent) {
        print("鼠标进入:\(currentIndexPath?.item)")
        let popoverController = NSBottomPopoverViewController()
        
        popOver = NSPopover()
        popOver.contentViewController = popoverController
        popOver.behavior = NSPopover.Behavior.semitransient
        popOver.show(relativeTo: self.view.bounds, of: self.view, preferredEdge: NSRectEdge.maxY)
    }
    
    override func mouseExited(with event: NSEvent) {
        print("鼠标移出")
        popOver.close()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

protocol CollectionViewItemDelegate {
    func didSelect(_ indexPath: IndexPath?) -> Void
}
