//
//  ViewController.swift
//  InputDemo
//
//  Created by etiantian on 2020/3/30.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {

    var accountLabel:NSText!
    var accountTextField:NSTextField!
    
    var passwordLabel:NSText!
    var passwordTextField:NSTextField!
    
    var loginButton:NSButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        layoutSubviews()
        
        print("视图加载完成")
    }
    
    private func setupSubviews() -> Void {
        accountTextField = NSTextField()
        accountTextField.textColor = NSColor.red
        accountTextField.placeholderString = "输入账号"
        self.view.addSubview(accountTextField)
        
        passwordTextField = NSTextField()
        passwordTextField.textColor = NSColor.red
        passwordTextField.placeholderString = "输入密码"
        self.view.addSubview(passwordTextField)
        
        loginButton = NSButton(title: "登录", target: self, action: #selector(loginButtonAction(button:)))
        self.view.addSubview(loginButton)
    }
    
    private func layoutSubviews() -> Void {
        
        accountTextField.snp.makeConstraints { (make) in
            make.left.equalTo(80)
            make.right.equalTo(-80)
            make.height.equalTo(50)
            make.centerY.equalTo(self.view).offset(-130)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(accountTextField)
            make.top.equalTo(accountTextField.snp.bottom).offset(30)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
    }
    
    @objc func loginButtonAction(button:NSButton) {
        print("登录按钮被点击")
        let secondVC = SecondPageViewController()
        self.presentAsModalWindow(secondVC)
        
    }
    
    
    
    override func viewWillAppear() {
        super.viewWillAppear()
        print("视图即将出现")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        print("视图已经出现")
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        print("视图即将消失")
    }
    
    override func viewDidDisappear() {
        super.viewDidDisappear()
        print("视图已经消息")
    }
    
    override func viewWillLayout() {
        super.viewWillLayout()
        print("视图即将布局")
    }
    
    override func viewDidLayout() {
        super.viewDidLayout()
        print("视图已经布局完成")
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

