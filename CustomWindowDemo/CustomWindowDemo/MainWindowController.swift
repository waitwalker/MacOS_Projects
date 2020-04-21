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
        let myWin = MainWindow(contentRect: NSRect(x: 0, y: 0, width: 600, height: 400), styleMask: styleMask, backing: NSWindow.BackingStoreType.buffered, defer: true)
        myWin.windowController = self
        myWin.isMovableByWindowBackground = true
        myWin.isMovable = true
        myWin.title = "window"
        return myWin
    }()

    override init(window: NSWindow?) {
        super.init(window: window)
        self.window = myWindow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        self.window = myWindow
    }

}
