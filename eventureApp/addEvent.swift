//
//  addEvent.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import Foundation
import UIKit


class addEvent {
    
    
    var image: UIImage
    var title: String
    var description: String
    var location: String
    var category: String
    var datetime: String
    var eventPlaceName: String
    var host: String
    var imageUrl: String
    
    
    init(image: UIImage, title: String, description: String, location: String, category: String, datetime: String, eventPlaceName: String, host: String, imageUrl: String) {
        
        self.image = image
        self.title = title
        self.description = description
        self.location = location
        self.category = category
        self.datetime = datetime
        self.eventPlaceName = eventPlaceName
        self.host = host
        self.imageUrl = imageUrl
        
    }
    
    func setImage(image: UIImage) {
        self.image = image
    }
    
    func getImageSize() -> CGSize {
        return self.image.size
    }
}
