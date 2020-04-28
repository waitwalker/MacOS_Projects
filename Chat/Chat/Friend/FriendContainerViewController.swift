//
//  FriendContainerViewController.swift
//  Chat
//
//  Created by etiantian on 2020/4/22.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

/*
 * name: FriendContainerViewController
 * description: 用户列表页面
 * author: waitwalker
 * date: 4.28
 */
class FriendContainerViewController: NSViewController {

    var userLeftContainerView: UserLeftView!
    var userRightContainerView: UserRightView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    /*
     * name: setupSubviews
     * description: 初始化子控件
     * author: waitwalker
     * date: 4.28
     */
    private func setupSubviews() -> Void {
        userLeftContainerView = UserLeftView(frame: NSRect(x: 0, y: 0, width: self.view.bounds.width / 4.0, height: self.view.bounds.height))
        self.view.addSubview(userLeftContainerView)
        
        userRightContainerView = UserRightView(frame: NSRect(x: self.view.bounds.width / 4.0 + 2.0, y: 0, width: self.view.bounds.width / 4.0 * 3 - 2.0, height: self.view.bounds.height))
        self.view.addSubview(userRightContainerView)
    }
    
}
