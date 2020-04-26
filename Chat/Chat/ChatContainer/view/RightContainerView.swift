//
//  RightContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class RightContainerView: NSView {

    var bubbleView: BubbleContainerView!
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.yellow.cgColor
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        bubbleView = BubbleContainerView(frame: NSRect(x: 100, y: 100, width: 100, height: 100), position: 1)
        self.addSubview(bubbleView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
