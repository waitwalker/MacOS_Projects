//
//  RecectChatItemModel.swift
//  Chat
//
//  Created by etiantian on 2020/4/23.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import HandyJSON

class RecentChatListModel: HandyJSON {
    
    var message: String?
    var code: Int?
    var data: [RecentChatItemModel]?
    
    
    
    required init() {
            
    }
}


class RecentChatItemModel: HandyJSON {
    var user_id: String = "999888001"
    var user_name: String = "python && Golang"
    var header: String = "134"
    var last_chat_time: String = "上午9:50"
    var last_message: String = "小猫咪的爪子: 你说的什么意思呢"
    var unread_message_count: Int = 12
    required init() {
        
    }
}
