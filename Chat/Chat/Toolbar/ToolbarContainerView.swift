//
//  ToolbarContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

/**
 1.ToolBar 容器
 2.
 */
class ToolbarContainerView: NSView {

    var searchContainerView: SearchContainerView!
    var addNewChatButton: NSButton!
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.blue.cgColor
        
        setupSubviews()
    }
    
    
    /// 初始化子控件
    /// - Returns: Void
    private func setupSubviews() -> Void {
        
        searchContainerView = SearchContainerView()
        searchContainerView.delegate = self
        self.addSubview(searchContainerView)
        
        searchContainerView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(120)
            make.centerY.equalTo(self)
            make.height.equalTo(20)
        }
        
        addNewChatButton = NSButton(image: NSImage(named: "add_new_chat")!, target: self, action: #selector(addNewChatAction))
        addNewChatButton.wantsLayer = true
        addNewChatButton.layer?.cornerRadius = 10.0
        self.addSubview(addNewChatButton)
        
        addNewChatButton.snp.makeConstraints { (make) in
            make.left.equalTo(searchContainerView.snp.right).offset(10)
            make.height.width.equalTo(20)
            make.centerY.equalTo(searchContainerView)
        }
        
        
        let button = NSButton(title: "居中", target: self, action: #selector(buttonAction))
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
    }
    
    // 添加新的聊天回调
    @objc func addNewChatAction() {
        let newChatController = AddNewChatViewController()
        NSApplication.shared.mainWindow?.contentViewController?.presentAsSheet(newChatController)
        
    }
    
    
    @objc func buttonAction() {
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    // 设置搜索popover
    func setupSearchPopover() -> Void {
        
        let searchVC = SearchPopoverViewController()
        
        let searchPopover = NSPopover()
        searchPopover.contentViewController = searchVC
        searchPopover.delegate = self
        searchPopover.behavior = NSPopover.Behavior.semitransient
        searchPopover.show(relativeTo: searchContainerView.bounds, of: searchContainerView, preferredEdge: NSRectEdge.maxY)
    }
    
}

/// 搜索输入框容器
extension ToolbarContainerView: SearchContainerDelegate {
    func searchContainerBecomeFirstResponder(_ searchContainerView: SearchContainerView) {
        print("搜索框变为第一响应者")
        setupSearchPopover()
    }
}

extension ToolbarContainerView: NSPopoverDelegate {
    func popoverDidClose(_ notification: Notification) {
        NSApplication.shared.mainWindow?.makeFirstResponder(self)
    }
}
