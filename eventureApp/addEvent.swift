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
    
    
    init(image: UIImage, title: String, description: String, location: String, category: String, datetime: String) {
        
        self.image = image
        self.title = title
        self.description = description
        self.location = location
        self.category = category
        self.datetime = datetime
        
    }
    
    func setImage(image: UIImage) {
        self.image = image
    }
    
    func getImageSize() -> CGSize {
        return self.image.size
    }
}
