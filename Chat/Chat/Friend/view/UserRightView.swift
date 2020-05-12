//
//  UserRightView.swift
//  Chat
//
//  Created by etiantian on 2020/4/28.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class UserRightView: NSView {
    
    var iconImageView: NSImageView!
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
        
        setupSeubviews()
    }
    
    /*
     * name: setupSeubviews
     * description: 初始化子控件
     * author: waitwalker
     * date: 2020.05.11
     */
    private func setupSeubviews() -> Void {
        iconImageView = NSImageView(image: NSImage(named: "user_placeholder")!)
        self.addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(243)
            make.width.equalTo(222)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
