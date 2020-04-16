//
//  AppDelegate.swift
//  CodeWindowDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let windowController = WindowController()
        windowController.showWindow(self)
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

