//
//  WindowController.swift
//  PureCodeWindow
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var wind: NSWindow = {
        let style: NSWindow.StyleMask = [NSWindow.StyleMask.titled,NSWindow.StyleMask.closable,NSWindow.StyleMask.resizable]
        let w = NSWindow(contentRect: CGRect(x: 0, y: 0, width: 500, height: 300), styleMask: style, backing: .buffered, defer: false)
        w.windowController = self
        w.isRestorable = false
        w.title = "代码创建Window"
        return w
    }()
    
    override init(window: NSWindow?) {
        super.init(window: window)
        
        self.window = wind
        self.contentViewController = SecondViewController()
        self.window?.center()
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
