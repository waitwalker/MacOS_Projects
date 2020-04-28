//
//  ToolbarMiddleContentView.swift
//  Chat
//
//  Created by etiantian on 2020/4/27.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

/*
 * name: ToolbarMiddleContentView
 * description: tool bar 中间部分容器
 * author: waitwalker
 * date: 4.28
 */
class ToolbarMiddleContentView: NSView {
    
    var chatButton: NSButton!
    var userButton: NSButton!
    var windowButton: NSButton!
    
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.clear.cgColor
        setupSubviews()
    }
    
    // 初始化子控件
    private func setupSubviews() -> Void {
        userButton = NSButton(image: NSImage(named: "toolbar_user_normal")!, target: self, action: #selector(userButtonAction(button:)))
        userButton.wantsLayer = true
        userButton.layer?.backgroundColor = NSColor.clear.cgColor
        userButton.layer?.borderColor = NSColor.clear.cgColor
        userButton.isBordered = false
        userButton.bezelStyle = .circular
        self.addSubview(userButton)
        
        userButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(24)
            make.center.equalTo(self)
        }
        
        chatButton = NSButton(image: NSImage(named: "toolbar_chat_selected")!, target: self, action: #selector(chatButtonAction(button:)))
        chatButton.wantsLayer = true
        chatButton.layer?.backgroundColor = NSColor.clear.cgColor
        chatButton.layer?.borderColor = NSColor.clear.cgColor
        chatButton.isBordered = false
        chatButton.bezelStyle = .circular
        self.addSubview(chatButton)
        
        chatButton.snp.makeConstraints { (make) in
            make.right.equalTo(userButton.snp.left).offset(-20)
            make.width.height.centerY.equalTo(userButton)
        }
        
        windowButton = NSButton(image: NSImage(named: "toolbar_window_normal")!, target: self, action: #selector(windowButtonAction(button:)))
        windowButton.wantsLayer = true
        windowButton.layer?.backgroundColor = NSColor.clear.cgColor
        windowButton.layer?.borderColor = NSColor.clear.cgColor
        windowButton.isBordered = false
        windowButton.bezelStyle = .circular
        self.addSubview(windowButton)

        windowButton.snp.makeConstraints { (make) in
            make.left.equalTo(userButton.snp.right).offset(20)
            make.width.height.centerY.equalTo(userButton)
        }
    }
    
    // chat按钮 action call back
    @objc func chatButtonAction(button: NSButton) -> Void {
        chatButton.image = NSImage(named: "toolbar_chat_selected")!
        userButton.image = NSImage(named: "toolbar_user_normal")!
        windowButton.image = NSImage(named: "toolbar_window_normal")!
        
        let storyBoard = NSStoryboard(name: "Main", bundle: nil)
        let chatViewController: ChatContainerViewController = storyBoard.instantiateController(identifier: NSStoryboard.SceneIdentifier("ChatViewController")) as ChatContainerViewController
        NSApplication.shared.mainWindow?.contentViewController = chatViewController
    }
    
    // user按钮 action call back
    @objc func userButtonAction(button: NSButton) -> Void {
        chatButton.image = NSImage(named: "toolbar_chat_normal")!
        userButton.image = NSImage(named: "toolbar_user_selected")!
        windowButton.image = NSImage(named: "toolbar_window_normal")!
        NSApplication.shared.mainWindow?.contentViewController = FriendContainerViewController()
    }
    
    // window按钮 action call back
    @objc func windowButtonAction(button: NSButton) -> Void {
        chatButton.image = NSImage(named: "toolbar_chat_normal")!
        userButton.image = NSImage(named: "toolbar_user_normal")!
        windowButton.image = NSImage(named: "toolbar_window_selected")!
        
        NSApplication.shared.mainWindow?.contentViewController = DynamicContainerViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
