//
//  SearchContentView.swift
//  Chat
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

/*
 1. 搜索容器
 **/
class SearchContainerView: NSView {

    var textField: SearchTextField!
    var imageView: NSImageView!
    var delegate: SearchContainerDelegate?
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer!.backgroundColor = NSColor.white.cgColor
        self.layer!.cornerRadius = 10.0
        setupSubviews()
    }
    
    // 初始化子控件
    func setupSubviews() -> Void {
        textField = SearchTextField()
        textField.backgroundColor = NSColor.clear
        textField.isBordered = false
        textField.wantsLayer = true
        textField.layer?.backgroundColor = NSColor.clear.cgColor
        textField.layer?.borderWidth = 1.0
        textField.layer?.borderColor = NSColor.clear.cgColor
        textField.textColor = NSColor.green
        textField.delegate = self
        textField.searchTextFieldDelegate = self
        self.addSubview(textField)
        textField?.snp.makeConstraints({ (make) in
            make.left.equalTo(10)
            make.right.equalTo(-30)
            make.height.equalTo(self)
            make.centerY.equalTo(self)
        })
        
        imageView = NSImageView()
        imageView.wantsLayer = true
        imageView.image = NSImage(named: "toolbar_search")
        textField.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.height.width.equalTo(18)
            make.centerY.equalTo(textField!)
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

/// 输入框协议
extension SearchContainerView: NSTextFieldDelegate, SearchTextFieldProtocol{
    func textFieldDidBecomeResponder(textField: SearchTextField) {
        imageView.isHidden = true
        self.delegate?.searchContainerBecomeFirstResponder(self)
    }
    
    func controlTextDidBeginEditing(_ obj: Notification) {
        
    }
    
    func controlTextDidChange(_ obj: Notification) {
        
    }
    
    func controlTextDidEndEditing(_ obj: Notification) {
        
    }
    
    func control(_ control: NSControl, textShouldBeginEditing fieldEditor: NSText) -> Bool {
        return true
    }
    
}


/// 自定义输入框
class SearchTextField: NSTextField {
    @objc var searchTextFieldDelegate: SearchTextFieldProtocol?
    
    override func becomeFirstResponder() -> Bool {
        let flag = super.becomeFirstResponder()
        if flag {
            self.searchTextFieldDelegate?.textFieldDidBecomeResponder(textField: self)
        }
        return flag
    }
}

/// 搜索输入框delegate
@objc protocol SearchTextFieldProtocol {
    func textFieldDidBecomeResponder(textField: SearchTextField) -> Void
}

/// 搜索容器协议
@objc protocol SearchContainerDelegate {
    func searchContainerBecomeFirstResponder(_ searchContainerView: SearchContainerView) -> Void
}
