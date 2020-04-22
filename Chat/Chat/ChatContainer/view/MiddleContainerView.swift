//
//  MiddleContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class MiddleContainerView: NSView {

    var leftBorder: NSView!
    var rightBorder: NSView!

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void {
        leftBorder = NSView()
        leftBorder.wantsLayer = true
        leftBorder.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(leftBorder)
        
        leftBorder.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(0.5)
        }
        
        rightBorder = NSView()
        rightBorder.wantsLayer = true
        rightBorder.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(rightBorder)
        
        rightBorder.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(0)
            make.width.equalTo(0.5)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    
}
