//
//  RightContainerView.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

/*
 * name: RightContainerView
 * description: 聊天页面右边容器
 * author: waitwalker
 * date: 4.28
 */
class RightContainerView: NSView {
    var titleLabel: NSTextField!
    var rightArrowImageView: NSImageView!
    var publishContentLabel: NSTextField!
    
    var mContainerView: NSView!
    var userCountLabel: NSTextField!
    var searchImageView: NSImageView!
    
    var bContainerView: NSView!
    var scrollView: NSScrollView!
    var tableView: NSTableView!
    
    
    
    
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor(red: 244 / 255.0, green: 246 / 255.0, blue: 248 / 255.0, alpha: 1.0).cgColor
        setupSubviews()
    }
    
    // 初始化子控件
    private func setupSubviews() -> Void {
        titleLabel = NSTextField()
        titleLabel.isEditable = false
        titleLabel.backgroundColor = NSColor.clear
        titleLabel.textColor = NSColor.black
        titleLabel.isBordered = false
        titleLabel.isBezeled = false
        titleLabel.stringValue = "群公告"
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        rightArrowImageView = NSImageView(image: NSImage(named: "right_arrow")!)
        self.addSubview(rightArrowImageView)
        
        rightArrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.height.width.equalTo(16)
            make.top.equalTo(10)
        }
        
        publishContentLabel = NSTextField()
        publishContentLabel.stringValue = "当一个人，没有业绩的时候，他准备放弃了！他会对身边的人说：这个市场不行，这个行业不行，这个领导不行，公司也不行，我不干了！\n当一个人每月都能做很多业绩，拿到很多收入，他会告诉你：市场挺好的，只要努力点、勤奋点，赚钱很容易，咱们多交流，一起好好干！\n你相信谁，你就成为谁！我们下意识的偏向谁，就将成为谁！\n与高人同行，与智者为伍。\n——永远不要相信失败者那张嘴。"
        publishContentLabel.isEditable = false
        publishContentLabel.backgroundColor = NSColor.clear
        publishContentLabel.textColor = NSColor.black
        publishContentLabel.isBordered = false
        publishContentLabel.isBezeled = false
        self.addSubview(publishContentLabel)
        
        publishContentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(40)
            make.right.equalTo(-10)
        }
        
        mContainerView = NSView()
        mContainerView.wantsLayer = true
        mContainerView.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.2).cgColor
        self.addSubview(mContainerView)
        mContainerView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.center.equalTo(self)
            make.height.equalTo(40)
        }
        
        userCountLabel = NSTextField()
        userCountLabel.isEditable = false
        userCountLabel.backgroundColor = NSColor.clear
        userCountLabel.textColor = NSColor.black
        userCountLabel.isBordered = false
        userCountLabel.isBezeled = false
        userCountLabel.stringValue = "成员  280/500"
        mContainerView.addSubview(userCountLabel)
        
        userCountLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.width.equalTo(100)
        }
        
        searchImageView = NSImageView(image: NSImage(named: "user_search")!)
        mContainerView.addSubview(searchImageView)
        
        searchImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.height.width.equalTo(16)
            make.top.equalTo(10)
        }
        
        bContainerView = NSView(frame: NSRect(x: 0, y: 0, width: self.bounds.width, height: 305))
        bContainerView.wantsLayer = true
        bContainerView.layer?.backgroundColor = NSColor.yellow.withAlphaComponent(0.2).cgColor
        self.addSubview(bContainerView)
        
        scrollView = NSScrollView(frame: bContainerView.bounds)
        scrollView.backgroundColor = NSColor.green
        bContainerView.addSubview(scrollView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
