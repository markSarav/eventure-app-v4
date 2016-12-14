//
//  addEvent.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/13/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import Foundation

import UIKit

class addRoom{
    var caption: String!
    var thumbnail: String!
    var id: String!
    var fileUrl: String!
    
    init(caption: String, thumbnail: String, id: String, fileUrl: String){
        self.caption = caption
        self.id = id
        self.thumbnail = thumbnail
        self.fileUrl = fileUrl
    }
    
}
