//
//  SecondViewController.swift
//  PureCodeWindow
//
//  Created by etiantian on 2020/4/16.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {
    
    lazy var myView: NSView = {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        let view = NSView(frame: frame)
        return view
    }()
    
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view = myView
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // Some boilerplate code to handle error (needed when override)
    }
    
}
