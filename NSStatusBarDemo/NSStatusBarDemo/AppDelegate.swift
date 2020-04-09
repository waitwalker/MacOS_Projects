//
//  AppDelegate.swift
//  NSStatusBarDemo
//
//  Created by etiantian on 2020/4/9.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var item: NSStatusItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let statusBar = NSStatusBar.system
        let statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.target = self
        statusItem.button?.action = #selector(itemAction(button:))
        statusItem.button?.title = "按钮"
        self.item = statusItem
        
        
    }
    
    @objc func itemAction(button:NSButton) -> Void {
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        let statusBar = NSStatusBar.system
        statusBar.removeStatusItem(self.item!)
    }


}

