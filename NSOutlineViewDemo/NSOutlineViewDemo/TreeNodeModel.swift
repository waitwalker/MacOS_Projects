//
//  TreeNodeModel.swift
//  NSOutlineViewDemo
//
//  Created by etiantian on 2020/4/13.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa

class TreeNodeModel: NSObject {
    var name:String?
    lazy var childNodes:Array = {
        return [TreeNodeModel]()
    }()
    
}
