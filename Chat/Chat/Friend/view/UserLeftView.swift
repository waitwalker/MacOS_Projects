//
//  UserLeftView.swift
//  Chat
//
//  Created by etiantian on 2020/4/28.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

/*
 * name: UserLeftView
 * description: 用户列表左边容器
 * author: waitwalker
 * date: 4.28
 */
class UserLeftView: NSView {

    var addNewUserButton: NSButton!
    var lineView: NSView!
    var scrollView: NSScrollView!
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.white.cgColor
        setupSubviews()
    }
    
    // 初始化子控件
    private func setupSubviews() -> Void {
        addNewUserButton = NSButton(title: "加好友", target: self, action: #selector(addNewUserAction))
        addNewUserButton.isBordered = true
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "加好友")
        let range: NSRange = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: NSColor.black, range: range)
        addNewUserButton.attributedTitle = attributedString
        self.addSubview(addNewUserButton)
        
        addNewUserButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(10)
            make.height.equalTo(40)
        }
        
        lineView = NSView()
        lineView.wantsLayer = true
        lineView.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.3).cgColor
        self.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(addNewUserButton.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
        
        scrollView = NSScrollView()
        scrollView.backgroundColor = NSColor.green
        scrollView.frame = NSRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 80)
        self.addSubview(scrollView)
    }
    
    @objc func addNewUserAction() -> Void {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
}
