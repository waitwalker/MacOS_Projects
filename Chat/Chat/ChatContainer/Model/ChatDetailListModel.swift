//
//  ChatDetailModel.swift
//  Chat
//
//  Created by etiantian on 2020/4/27.
//  Copyright © 2020 etiantian. All rights reserved.
//

import Cocoa
import HandyJSON

/*
 * name: ChatDetailListModel
 * description: 中间聊天详情列表
 * author: waitwalker
 * date: 4.27
 */
class ChatDetailListModel: HandyJSON {
    var message: String?
    var code: Int?
    var data: [ChatDetailItemModel]?
    
    
    
    required init() {
            
    }
}

/*
* name: ChatDetailListModel
* description: 中间聊天详情item model
* author: waitwalker
* date: 4.27
*/
class ChatDetailItemModel: HandyJSON {
    var user_id: String = "999888001"
    var user_name: String = "python && Golang"
    var header: String = "134"
    var last_chat_time: String = "上午9:50"
    var last_message: String = "小猫咪的爪子: 你说的什么意思呢"
    
    // 用户类型 1其他人 2自己
    var user_type: Int = 1
    
    // 消息类型 1文本 2图片
    var message_type: Int = 1
    
    var measage_height: CGFloat = 80.0
    var cell_height: CGFloat = 80.0
    
    required init() {
        
    }
}
