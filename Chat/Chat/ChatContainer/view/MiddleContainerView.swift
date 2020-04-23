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
    var topContainerView: NSView!
    var nameLabel: NSTextField!
    var addGroupUserButton: NSButton!
    var foldButton: NSButton!
    
    

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
        
        topContainerView = NSView()
        topContainerView.wantsLayer = true
        topContainerView.layer?.backgroundColor = NSColor.white.cgColor
        self.addSubview(topContainerView)
        topContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(2)
            make.right.equalTo(-2)
            make.height.equalTo(60)
        }
        
        nameLabel = NSTextField()
        nameLabel.stringValue = "python && Golang"
        nameLabel.isEditable = false
        nameLabel.textColor = NSColor.black
        nameLabel.backgroundColor = NSColor.white
        nameLabel.font = NSFont.systemFont(ofSize: 15)
        nameLabel.sizeToFit()
        nameLabel.isBordered = false
        nameLabel.isBezeled = false
        topContainerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalTo(topContainerView)
        }
        
        foldButton = NSButton(image: NSImage(named: "add_new_chat")!, target: self, action: #selector(foldButtonAction))
        topContainerView.addSubview(foldButton)
        foldButton.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.height.width.equalTo(40)
            make.centerY.equalTo(topContainerView)
        }
        
        addGroupUserButton = NSButton(image: NSImage(named: "add_new_chat")!, target: self, action: #selector(addGroupUserButtonAction))
        topContainerView.addSubview(addGroupUserButton)
        addGroupUserButton.snp.makeConstraints { (make) in
            make.right.equalTo(foldButton.snp.left).offset(-10)
            make.height.width.equalTo(40)
            make.centerY.equalTo(topContainerView)
        }
        
        
    }
    
    @objc func foldButtonAction() -> Void {
        
    }
    
    @objc func addGroupUserButtonAction() -> Void {
        
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    
}
