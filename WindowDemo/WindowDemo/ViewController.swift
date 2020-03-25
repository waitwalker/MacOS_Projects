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
        
        let style:NSWindow.StyleMask = [.titled,.closable,.resizable,.miniaturizable]
        
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 1500, height: 1500), styleMask: style, backing: .buffered, defer: true, screen: nil)
        window.title = "新创建的窗口"
        window.backgroundColor = .green
        window.standardWindowButton(.documentVersionsButton)?.image = NSImage(named: "c_enntrance_home_banner")
        
        // 显示窗口
        window.makeKeyAndOrderFront(self)
        
        // 窗口居中
        window.center()
        
        // window contentView
        let contentView = NSView(frame: window.frame)
        window.contentView = contentView
        
        // ScrollView
        let scrollView:NSScrollView = NSScrollView(frame: window.contentView!.frame)
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        let image = NSImage(named: "c_enntrance_home_banner")
        let imageView = NSImageView(frame: NSRect(x: 0, y: 50, width: 300, height: 300))
        imageView.setFrameSize(image!.size)
        imageView.image = image
        scrollView.addSubview(imageView)
        
        
        
        let imageView2 = NSImageView(frame: NSRect(x: 0, y: 350, width: 300, height: 300))
        imageView2.image = image
        scrollView.documentView = imageView2
        scrollView.addSubview(imageView2)
        
        let imageView3 = NSImageView(frame: NSRect(x: 0, y: 650, width: 300, height: 300))
        imageView3.setFrameSize(image!.size)
        imageView3.image = image
        scrollView.addSubview(imageView3)
        
        let imageView4 = NSImageView(frame: NSRect(x: 0, y: 950, width: 300, height: 300))
        imageView4.setFrameSize(image!.size)
        imageView4.image = image
        scrollView.addSubview(imageView4)
        
        let imageView5 = NSImageView(frame: NSRect(x: 0, y: 1250, width: 300, height: 300))
        imageView5.setFrameSize(image!.size)
        imageView5.image = image
        scrollView.addSubview(imageView5)
        
        let imageView6 = NSImageView(frame: NSRect(x: 0, y: 1550, width: 300, height: 300))
        imageView6.setFrameSize(image!.size)
        imageView6.image = image
        scrollView.addSubview(imageView6)
        
        let imageView7 = NSImageView(frame: NSRect(x: 0, y: 1850, width: 300, height: 300))
        imageView7.setFrameSize(image!.size)
        imageView7.image = image
        scrollView.addSubview(imageView7)
        
        
        
        contentView.addSubview(scrollView)
        
        
        
        
        
//        let btn:NSButton = NSButton(title: "关闭", target: self, action: #selector(windowButtonAction))
//        btn.frame = NSRect(x: 100, y: 100, width: 100, height: 100)
//        btn.layer?.backgroundColor = NSColor.brown.cgColor
//        btn.layer?.borderWidth = 5.0
//        btn.layer?.borderColor = NSColor.cyan.cgColor
//
//        contentView.addSubview(btn)
        
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

