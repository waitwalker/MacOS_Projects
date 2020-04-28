//
//  UserLeftView.swift
//  Chat
//
//  Created by etiantian on 2020/4/28.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class UserLeftView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}
