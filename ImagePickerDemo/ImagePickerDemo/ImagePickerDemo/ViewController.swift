//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by etiantian on 2020/3/30.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button:NSButton = NSButton(title: "点击", target: self, action: #selector(buttonAction))
        button.frame = NSRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction() {
        let imageView = NSImageView(frame: NSRect(x: 100, y: 300, width: 300, height: 300))
        self.view.addSubview(imageView)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

