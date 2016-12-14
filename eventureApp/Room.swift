//
//  Room.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/13/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Room{
    var caption: String!
    var thumbnail: String!
    var id: String!
    var fileUrl: String!
    
    init(key: String, snapshot: Dictionary<String, AnyObject>){
        self.id = key
        self.caption = snapshot["caption"] as? String
        self.thumbnail = snapshot["tumbnailURLFromStorage"] as? String
        self.fileUrl = snapshot["fileUrl"] as? String
    }
}
