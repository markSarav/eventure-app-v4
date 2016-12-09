//
//  Event.swift
//  eventure-app
//
//  Created by Lucas Padden on 10/19/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//


/*
 /  This is the event class.  It defines the structure of an event object.
 /
 /
 */
import Foundation
class Event {
    
    // instance variables for initializer
    let dateCreated: String!
    let event_id: String!
    let avatar_img: String!
    let chatChannel: Int!
    //    var icon_img: String
    let eventImage: String! //Change this to array later
    let eventCategory: String!
    //    let host_id: String  // this will be firstbase uid
    let eventTitle: String!
    let eventDescription: String!
    let eventDate: String!
    let eventTime: String!
    let eventHost: String! // Needs to be changed.
    let eventLocationAddress: String!
    let eventPlaceName: String!
    
    
    
    // define an initializer for Event objects
    init(eventKey: String, snapshot: Dictionary<String, AnyObject>) {
        self.event_id = eventKey
        self.dateCreated = snapshot["dateCreated"] as? String
        self.eventCategory = snapshot["category"] as? String
        self.eventTitle = snapshot["title"] as? String
        self.avatar_img = snapshot["avatar"] as? String
        self.chatChannel = snapshot["chatChannel"] as? Int
        self.eventImage = snapshot["eventImage"] as? String
        self.eventDescription = snapshot["eventDescription"] as? String
        self.eventDate = snapshot["eventDate"] as? String
        self.eventTime = snapshot["eventTime"] as? String
        self.eventLocationAddress = snapshot["eventLocationAddress"] as? String
        self.eventPlaceName = snapshot["eventPlaceName"] as? String
        self.eventHost = snapshot["eventHost"] as? String // this needs to be set at time of creation by grabbing currrent users name
        
        
    }
}
/****** define functions for the event class ******/
/*
 // getter functions for an event object
 func getDateCreated() -> String {
 // returns the date that the event was created
 return created
 }
 
 func getEventID() -> String {
 // returns the event id for an event object
 return event_id
 }
 
 func getAvatarImage() -> String {
 // returns a link to the images address on the internet
 return avatar_img
 }
 
 //
 //    func getIconImage() -> String {
 //        // returns a link to the images address on the internet
 //        return icon_img
 //    }
 
 func getEventImages() -> NSMutableArray {
 // returns an array of links to images taken at the event
 // images may need to be hosted somewhere?
 // if a user posts an image maybe the link can be gathered from its location on the server
 return event_images
 }
 
 //    func getHostID() -> String {
 //        // return the user's host ID possibly could be a string or integer not sure
 //        // for now it will be a string
 //        return host_id
 //    }
 //
 func getTitleText() -> String {
 // returns the title text of the event
 return title_text
 }
 
 // setter functions for an event object
 
 func setAvatarImg(imageLink: String) {
 // sets the avatar image for an event
 avatar_img = imageLink
 }
 
 
 func setEventCategroy(eventCategory: String) {
 // sets the event category for an event object
 event_category = eventCategory
 }
 
 //    func setIconImage(iconImage: String) {
 //        // sets the icon image for an event
 //        icon_img = iconImage
 //    }
 
 // other functions
 
 func addImage(image: String) {
 // adds an image to the event_images array.
 event_images.add(image)
 }
 
 
 
 */
