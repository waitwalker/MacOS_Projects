//
//  AppDelegate.swift
//  DocumentBasedDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    @IBAction func menuItemAction(_ sender: NSMenuItem) {
        print("点击word menu item")
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateController(withIdentifier: "Word Count Window Controller") as! NSWindowController
        if let wordCountWindow = wordCountWindowController.window {
            let wordCountVC = wordCountWindowController.contentViewController as! WordCountViewController
            NSApplication.shared.runModal(for: wordCountWindow)
            wordCountWindow.close()
        }
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

