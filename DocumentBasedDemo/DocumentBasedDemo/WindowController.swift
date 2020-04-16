//
//  WindowController.swift
//  DocumentBasedDemo
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        if let window = window, let screen = window.screen {
            let offsetFromLeftOfScrren = CGFloat(150)
            let offsetFromTopOfScreen = CGFloat(150)
            let screenFrame = screen.visibleFrame
            let offsetFromBottomOfScreen = screenFrame.maxY - window.frame.height - offsetFromTopOfScreen
            window.setFrameOrigin(CGPoint(x: offsetFromLeftOfScrren, y: offsetFromBottomOfScreen))
            
        }
        
    }

}
