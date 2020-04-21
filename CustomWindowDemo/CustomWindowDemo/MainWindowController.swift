//
//  MainWindowController.swift
//  CustomWindowDemo
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    lazy var myWindow: MainWindow = {
        let styleMask:NSWindow.StyleMask = [.miniaturizable, .titled, .closable]
        let myWin = MainWindow(contentRect: NSRect(x: 0, y: 0, width: 600, height: 400), styleMask: NSWindow.StyleMask.closable, backing: NSWindow.BackingStoreType.buffered, defer: true)
        myWin.windowController = self
        myWin.isMovableByWindowBackground = true
        myWin.isMovable = true
        myWin.title = "window"
        return myWin
    }()

    override init(window: NSWindow?) {
        super.init(window: window)
        self.window = myWindow
        self.window?.contentView = WindowContentView(frame: NSRect(x: 0, y: 0, width: 600, height: 400))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }

}

class WindowContentView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 50))
        textField.stringValue = "北京"
        self.addSubview(textField)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
