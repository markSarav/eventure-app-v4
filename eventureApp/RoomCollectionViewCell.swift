//
//  RoomCollectionViewCell.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/13/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import FirebaseStorage

class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailPhoto: UIImageView!
    
    @IBOutlet weak var captionLBL: UILabel!
    
    func configureCell(room: Room){
        self.captionLBL.text = room.caption
        if let imageUrl = room.thumbnail {
            if imageUrl.hasPrefix("gs://"){
                FIRStorage.storage().reference(forURL: imageUrl).data(withMaxSize: INT_FAST64_MAX, completion: {
                    (data, error) in
                    if let error = error {
                        print("Error downloading: \(error)")
                        return
                    }
                    self.thumbnailPhoto.image = UIImage.init(data: data!)
                })
            }else if let url = NSURL(string: imageUrl), let data = NSData(contentsOf: url as URL){
                self.thumbnailPhoto.image = UIImage.init(data: data as Data)
            }
        }
        
    }
}
