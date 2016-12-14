//
//  Message.swift
//  eventure-app
//
//  Created by Lucas Padden on 10/19/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import Foundation
class Message {
    var message_id: String
    var user_id: String
    var content: String
    var chatroom_id: String
    var date_sent: NSDate    // this value might need to be calculated in a function
    
    init(message_id: String, user_id: String, content: String, chatroom_id: String, date_sent: NSDate) {
        self.message_id = message_id
        self.user_id = user_id
        self.content = content
        self.chatroom_id = chatroom_id
        self.date_sent = date_sent
    }
    
  
    
}
