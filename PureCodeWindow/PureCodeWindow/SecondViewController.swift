//
//  SecondViewController.swift
//  PureCodeWindow
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let viewT = NSView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
        
        self.view = viewT
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
