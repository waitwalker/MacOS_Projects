//
//  Window.swift
//  EventDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class Window: NSWindow {

    override func sendEvent(_ event: NSEvent) {
        print("监听所有事件:\(event)")
        super.sendEvent(event)
    }
    
    
    override func mouseDown(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("鼠标落下:\(locationPoint)")
        
        print("鼠标点击次数:\(event.clickCount)")
        super.mouseDown(with: event)
    }
    
    override func mouseUp(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("鼠标抬起:\(locationPoint)")
        super.mouseUp(with: event)
    }
    
    override func mouseExited(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("鼠标退出:\(locationPoint)")
        super.mouseExited(with: event)
    }
    
    override func mouseMoved(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("鼠标移动:\(locationPoint)")
        super.mouseMoved(with: event)
    }
    
    override func mouseDragged(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("鼠标拖动:\(locationPoint)")
        super.mouseDragged(with: event)
    }
    
    override func rightMouseDown(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("右键鼠标落下:\(locationPoint)")
        super.rightMouseDown(with: event)
    }
    
    override func rightMouseUp(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("右键鼠标抬起:\(locationPoint)")
        super.rightMouseUp(with: event)
    }
    
    override func rightMouseDragged(with event: NSEvent) {
        let locationPoint = event.locationInWindow
        print("右键鼠标拖动:\(locationPoint)")
        super.rightMouseDragged(with: event)
    }
    
    // 设置鼠标光标
    override func cursorUpdate(with event: NSEvent) {
        NSCursor.crosshair.set()
        super.cursorUpdate(with: event)
    }
    
}
