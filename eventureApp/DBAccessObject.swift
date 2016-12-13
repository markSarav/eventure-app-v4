//
//  DBAccessObject.swift
//  eventureApp
//
//  Created by Lucas Padden on 10/22/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import FirebaseDatabase
import Firebase
import FirebaseAuth

/*
 /
 /  This class is used for all the DB handlers, i.e inserting data, retrieving data, updating the db
 /
 */


import Foundation

class DBAccessObject {
    
    var DBReference: FIRDatabaseReference
    
    init(DBAccessObj: FIRDatabaseReference) {
        // creates a reference to access the database
        self.DBReference = DBAccessObj.database.reference()
    }
    
    private var roomref = FIRDatabase.database().reference()
    var roomRef: FIRDatabaseReference{
        return roomref
    }
    private var storageref: FIRStorageReference{
        return FIRStorage.storage().reference()
    }
    
    
    
    var fileURL: String!
    

    
    func CreateNewRoom(user: FIRUser, caption: String, data: NSData){
        let filePath = "\(user.uid)/\(Int(NSDate.timeIntervalSinceReferenceDate))"
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/png"
        storageref.child(filePath).put(data as Data, metadata: metaData) { (metadata, error) in
            if let error = error {
                print("Error uploading:")
                return
            }
            self.fileURL = metadata!.downloadURLs![0].absoluteString
            if let user = FIRAuth.auth()?.currentUser {
                let idRoom = self.DBReference.child("rooms").childByAutoId()
                idRoom.setValue(["caption": caption, "thumbnailURLFromStorage":self.DBReference.child(metadata!.path!).description(),"fileUrl":self.fileURL])
            }
        }
    }
    
    func fetchDataFromServer(callback: @escaping (Room) -> ()) {
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        let db = DBAccessObject(DBAccessObj: ref)
        db.roomRef.observe(.childAdded, with: { (snapshot) in
            let room = Room(key: snapshot.key, snapshot: snapshot.value as! Dictionary<String, AnyObject>)
            callback(room)
        })
    }

    // adds an event to the db
    func addEventTreeStructure(eventRoot: String, attendees: NSMutableArray, title: String, description: String, avatar: String, Category: String, chatChannel: Int, images: NSMutableArray, startDate: String, endDate: String, longitude: Double, latitude: Double) {
        
       
        
        let eventKey = DBReference.child(eventRoot).childByAutoId()
        
        //        var event = Event(dateCreated: dateCreated, eventID: eventKey.key, avatar: avatar, chatChannelNumber: chatChannel, images: images, category: Category, title: title, longitude: longitude,  latitude: latitude)
        // print("Event id" + event.event_id)
        
        eventKey.child("attendees").setValue(attendees)
        eventKey.child("title").setValue(title)
        eventKey.child("description").setValue(description)
        eventKey.child("avatar").setValue(avatar)
        eventKey.child("category").setValue(Category)
        eventKey.child("chatChannel").setValue(chatChannel)
        eventKey.child("images").setValue(images)
        eventKey.child("startDate").setValue(startDate)
        eventKey.child("endDate").setValue(endDate)
        eventKey.child("longitude").setValue(longitude)
        eventKey.child("latitude").setValue(latitude)
        
    }
    
    
   
}
