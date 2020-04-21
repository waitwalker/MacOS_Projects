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
        let styleMask:NSWindow.StyleMask = [.miniaturizable, .titled, .closable, .borderless]
        
        let myWin = MainWindow(contentRect: NSRect(x: 0, y: 0, width: 600, height: 400), styleMask: styleMask, backing: NSWindow.BackingStoreType.buffered, defer: true)
        myWin.windowController = self
        myWin.isMovableByWindowBackground = true
        myWin.isMovable = true
        myWin.titlebarAppearsTransparent = true
        myWin.title = "window"
        return myWin
    }()

    override init(window: NSWindow?) {
        super.init(window: window)
        self.window = myWindow
        
        let themeView = self.window?.contentView?.superview
        let titleView = themeView?.subviews[1]
        
        titleView?.autoresizesSubviews = true
        
        
        
        
//        let contentView = WindowContentView(frame: NSRect(x: 0, y: 0, width: 600, height: 400))
//        contentView.wantsLayer = true
//        contentView.layer?.cornerRadius = 16.0
//        //contentView.layer?.backgroundColor = NSColor.red.cgColor
//
//
//
//
//        self.window?.contentView = contentView
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
//        let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 50))
//        textField.stringValue = "北京"
//        self.addSubview(textField)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
