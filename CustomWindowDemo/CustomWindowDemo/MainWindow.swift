//
//  MainWindow.swift
//  CustomWindowDemo
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing bufferingType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: bufferingType, defer: flag)
    }
    
    deinit {
       Swift.print("release object")
    }
    
    override func orderFront(_ sender: Any?) {
        super.orderFront(sender)
    }
    
    
    override func orderOut(_ sender: Any?) {
        super.orderOut(sender)
    }
    
    override func makeKeyAndOrderFront(_ sender: Any?) {
        super.makeKeyAndOrderFront(sender)
    }
    
    
    override func makeKey() {
        super.makeKey()
    }
}
