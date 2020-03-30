//
//  ViewController.swift
//  InputDemo
//
//  Created by etiantian on 2020/3/30.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField:NSTextField = NSTextField(frame: NSRect(x: 100, y: 100, width: 200, height: 60))
        textField.textColor = NSColor.red
        self.view.addSubview(textField)
        
        print("视图加载完成")
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

