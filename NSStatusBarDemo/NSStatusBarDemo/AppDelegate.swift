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

    @IBOutlet weak var statusItemMenu: NSMenu!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let statusBar = NSStatusBar.system
        let statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.target = self
        statusItem.button?.action = #selector(itemAction(button:))
        statusItem.button?.title = "按钮"
        self.item = statusItem
        
        statusItem.menu = statusItemMenu
    }
    
    @objc func itemAction(button:NSButton) -> Void {
        print("status item did click")
    }
    
    
    @IBAction func item1Action(_ sender: NSMenuItem) {
        print("item1Action")
    }
    
    @IBAction func item2Action(_ sender: NSMenuItem) {
        print("item2Action")
    }
    
    @IBAction func item3Action(_ sender: NSMenuItem) {
        print("item3Action")
    }
    
    
    func applicationWillTerminate(_ aNotification: Notification) {
        let statusBar = NSStatusBar.system
        statusBar.removeStatusItem(self.item!)
    }


}

