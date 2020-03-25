//
//  ViewController.swift
//  WindowDemo
//
//  Created by etiantian on 2020/3/24.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var window:NSWindow?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = NSButton()
        button.title = "四中"
        button.contentTintColor = .blue
        button.frame = NSRect(x: 200, y: 300, width: 300, height: 300)
        button.target = self
        button.action = #selector(buttonAction)
        self.view.addSubview(button)
        
        setupNotification()
        
    }
    
    func setupNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(notKeyWindowAction), name: NSWindow.didResignKeyNotification, object: nil)
    }
    
    @objc func notKeyWindowAction() -> Void {
        print("当前窗口不再是key window了")
    }
    
    @objc func buttonAction() -> Void {
        print("按钮点击了");
        /*
         public static var borderless: NSWindow.StyleMask { get }

         public static var titled: NSWindow.StyleMask { get }

         public static var closable: NSWindow.StyleMask { get }

         public static var miniaturizable: NSWindow.StyleMask { get }

         public static var resizable: NSWindow.StyleMask { get }

         
         @available(OSX, introduced: 10.2, deprecated: 100000, message: "Textured window style should no longer be used")
         public static var texturedBackground: NSWindow.StyleMask { get }

         
         public static var unifiedTitleAndToolbar: NSWindow.StyleMask { get }

         
         @available(OSX 10.7, *)
         public static var fullScreen: NSWindow.StyleMask { get }

         
         @available(OSX 10.10, *)
         public static var fullSizeContentView: NSWindow.StyleMask { get }

         
         public static var utilityWindow: NSWindow.StyleMask { get }

         public static var docModalWindow: NSWindow.StyleMask { get }

         public static var nonactivatingPanel: NSWindow.StyleMask { get }

         @available(OSX 10.6, *)
         public static var hudWindow: NSWindow.StyleMask { get }
         */
        
        let style:NSWindow.StyleMask = .titled
        
        let window = NSWindow(contentRect: NSRect(x: 200, y: 800, width: 300, height: 300), styleMask: style, backing: .buffered, defer: true, screen: nil)
        window.title = "新创建的窗口"
        window.backgroundColor = .red
        // 显示窗口
        window.makeKeyAndOrderFront(self)
        
        // 窗口居中
        window.center()
        
        
        let btn:NSButton = NSButton(title: "关闭", target: self, action: #selector(windowButtonAction))
        btn.frame = NSRect(x: 100, y: 100, width: 100, height: 100)
        window.contentView = btn
        
        self.window = window
    }
    
    @objc func windowButtonAction() {
        self.window?.close()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

