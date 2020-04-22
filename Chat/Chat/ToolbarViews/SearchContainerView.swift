//
//  SearchContentView.swift
//  Chat
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class SearchContainerView: NSView {

    var textField: SearchTextField!
    var imageView: NSImageView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.layer!.backgroundColor = NSColor.white.cgColor
        self.layer!.cornerRadius = 10.0
        setupSubviews()
    }
    
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
        imageView.layer?.backgroundColor = NSColor.green.cgColor
        textField.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
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

extension SearchContainerView: NSTextFieldDelegate, SearchTextFieldProtocol{
    func textFieldDidBecomeSearchTextField(textField: SearchTextField) {
        imageView.isHidden = true
    }
    
    func controlTextDidBeginEditing(_ obj: Notification) {
        
    }
    
    func control(_ control: NSControl, textShouldBeginEditing fieldEditor: NSText) -> Bool {
        return true
    }
    
}

class SearchTextField: NSTextField {
    @objc var searchTextFieldDelegate: SearchTextFieldProtocol?
    
    override func becomeFirstResponder() -> Bool {
        let flag = super.becomeFirstResponder()
        if flag {
            self.searchTextFieldDelegate?.textFieldDidBecomeSearchTextField(textField: self)
        }
        return flag
    }
}


/// 搜索输入框delegate
@objc protocol SearchTextFieldProtocol {
    func textFieldDidBecomeSearchTextField(textField: SearchTextField) -> Void
}
