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
    var toolbarContainerView: ToolbarContainerView!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        setupToolbar()
    }
    
    //
    private func setupToolbar() -> Void {
        toolbarView.wantsLayer = true
        toolbarView.layer?.backgroundColor = NSColor.red.cgColor
        
        toolbarContainerView = ToolbarContainerView()
        toolbarView.addSubview(toolbarContainerView)
        
        toolbarContainerView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(toolbarView)
        }
    
    }
}
