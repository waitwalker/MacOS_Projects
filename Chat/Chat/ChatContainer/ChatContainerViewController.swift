//
//  ChatContainerViewController.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class ChatContainerViewController: NSViewController {

    var leftContainerView: LeftContainerView!
    var middleContainerView: MiddleContainerView!
    var rightContainerView: RightContainerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        leftContainerView = LeftContainerView(frame: NSRect(x: 0, y: 0, width: 960 / 3.5, height: 650))
        self.view.addSubview(leftContainerView)
        
        middleContainerView = MiddleContainerView(frame: NSRect(x: 960 / 3.5, y: 0, width: 440, height: 650))
        self.view.addSubview(middleContainerView)
        
        rightContainerView = RightContainerView(frame: NSRect(x: (960 / 3.5 + 950 / 4), y: 0, width: 960 / 4, height: 650))
        self.view.addSubview(rightContainerView)
        
    }
    
}
