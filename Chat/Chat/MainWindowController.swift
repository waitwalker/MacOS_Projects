//
//  MainWindowController.swift
//  Chat
//
//  Created by etiantian on 2020/4/21.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import SnapKit
class MainWindowController: NSWindowController {
    
    @IBOutlet weak var toolbarView: NSView!
    override func windowDidLoad() {
        super.windowDidLoad()
        setupToolbar()
    }
    
    //
    func setupToolbar() -> Void {
        toolbarView.wantsLayer = true
        toolbarView.layer?.backgroundColor = NSColor.red.cgColor
        
        let searchContainerView = SearchContainerView()
        toolbarView.addSubview(searchContainerView)
        
        searchContainerView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(120)
            make.centerY.equalTo(toolbarView)
            make.height.equalTo(20)
        }
        
        
        let button = NSButton(title: "居中", target: self, action: #selector(buttonAction))
        toolbarView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(toolbarView)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
    }
    
    @objc func buttonAction() {
        
    }

}
