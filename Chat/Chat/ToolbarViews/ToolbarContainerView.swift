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

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.blue.cgColor
        
        setupSubviews()
    }
    
    
    /// 初始化子控件
    /// - Returns: Void
    func setupSubviews() -> Void {
        
        let searchContainerView = SearchContainerView()
        searchContainerView.delegate = self
        self.addSubview(searchContainerView)
        
        searchContainerView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(120)
            make.centerY.equalTo(self)
            make.height.equalTo(20)
        }
        
        
        let button = NSButton(title: "居中", target: self, action: #selector(buttonAction))
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
    }
    
    
    @objc func buttonAction() {
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}

/// 搜索输入框容器
extension ToolbarContainerView: SearchContainerDelegate {
    func searchContainerBecomeFirstResponder(_ searchContainerView: SearchContainerView) {
        print("搜索框变为第一响应者")
    }
}
