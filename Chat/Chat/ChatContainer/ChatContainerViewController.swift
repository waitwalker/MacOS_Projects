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
        leftContainerView = LeftContainerView()
        self.view.addSubview(leftContainerView)
        
        leftContainerView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.width.equalTo(self.view.frame.width / 3.5)
        }
        
        rightContainerView = RightContainerView()
        self.view.addSubview(rightContainerView)
        
        rightContainerView.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(0)
            make.width.equalTo(self.view.frame.width / 4.0)
        }
        
        middleContainerView = MiddleContainerView()
        self.view.addSubview(middleContainerView)
        
        middleContainerView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(leftContainerView.snp.right).offset(0)
            make.right.equalTo(rightContainerView.snp.left).offset(0)
        }
    }
    
}
