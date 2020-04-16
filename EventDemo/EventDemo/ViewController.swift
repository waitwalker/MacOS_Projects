//
//  ViewController.swift
//  EventDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var gEventHandler: Any?
    var lEventHandler: Any?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        startGlobalEeventListen()
        startLocalEventListen()
    }
    
    
    override func mouseDown(with event: NSEvent) {
        print("鼠标 mouse down:\(event)")
    }
    
    override func keyDown(with event: NSEvent) {
        print("key down:\(event)")
    }
    
    func startGlobalEeventListen() -> Void {
        self.gEventHandler = NSEvent.addGlobalMonitorForEvents(matching: [NSEvent.EventTypeMask.keyDown,NSEvent.EventTypeMask.leftMouseDown], handler: { (event) in
            print("global event:\(event)")
        })
    }
    
    func startLocalEventListen() -> Void {
        self.lEventHandler = NSEvent.addLocalMonitorForEvents(matching: [NSEvent.EventTypeMask.keyDown,NSEvent.EventTypeMask.leftMouseDown], handler: { (event) -> NSEvent? in
            print("local event:\(event)")
            return event
        })
    }
    
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func stopEvent() -> Void {
        NSEvent.removeMonitor(self.gEventHandler)
        NSEvent.removeMonitor(self.lEventHandler)
    }
    
    deinit {
        stopEvent()
    }


}

