//
//  DateTableViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import Firebase

class DateTableViewController: UITableViewController {
    
    var eventObject: addEvent!
    var imageName: String!
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    
    override func viewDidLoad() {
        print("The category is \(eventObject.category)")
    }
    @IBAction func addEvent(_ sender: Any) {
        
        
        
        
        
        // add event to the database.
        
        
        
        // create a string for the google maps api.
        let baseUrl = "https://maps.googleapis.com/maps/api/geocode/json?"
        
        // store the api key
        let apikey = "AIzaSyCBbEHnpzqPwuD4FITiwVakMq2HjsBA5sw"
        
        // get the location from the text field.
        let parameterStr = eventObject.location
        
        // temporarilly store longitude and latitude with default values
        var longitude = 0.0
        var latitude = 0.0
        
        // search and replace in a string
        let replaceStr = parameterStr.replacingOccurrences(of: " ", with: "+")
        
        // create the finished string to send a request to.
        let urlStr = "\(baseUrl)address=\(replaceStr)&key=\(apikey)"
        
        // create a url.
        let url = URL(string: urlStr)
        
        
        var formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-YYYY hh:mm"
        eventObject.datetime = formatter.string(from: datePickerView.date)
        
        
        DispatchQueue.global().async {
            
            self.imageName = NSUUID().uuidString
            
            let storageRef = FIRStorage.storage().reference().child("\(self.imageName!).png")
            
            if let uploadData = UIImagePNGRepresentation(self.eventObject.image) {
                
                storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil {
                        
                    }
                    else {
                        return
                    }
                    
                    if let eventImageURL = metadata?.downloadURL()?.absoluteString {
                        
                        self.eventObject.imageUrl = eventImageURL
                        
                        print("THE IMAGE URL IS \(self.eventObject.imageUrl)")
                    }
                    
                })
                
            }
        }
            
            
            
            
            // run this code on a background thread.
            DispatchQueue.global().async {
                
                
                
                
                
                // create a URLSession task to be completed.
                let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                    
                    if let data = data {
                        
                        
                        // get the geocoding data from google maps api as JSON
                        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                        
                        // access the necessary longitude and latitude information
                        if let result = json["results"] as? NSArray {
                            if let geometry = (result[0] as! NSDictionary)["geometry"] {
                                if let location = geometry as? NSDictionary {
                                    if let loc = location["location"] as? NSDictionary {
                                        longitude = loc["lat"]! as! Double
                                        latitude = loc["lng"]! as! Double
                                        
                                        // run this code on the main thread.
                                        DispatchQueue.main.async {
                                            
                                            // create a reference to firebase database.
                                            let ref: FIRDatabaseReference = FIRDatabase.database().reference()
                                            
                                            // create an access point to add info to the database.
                                            let db = DBAccessObject(DBAccessObj: ref)
                                            
                                            // add the event to the database.
                                            db.addEventTreeStructure(eventRoot: "Events",attendees: [], title:
                                                self.eventObject.title, description: self.eventObject.description, avatar: self.eventObject.imageUrl,Category: self.eventObject.category,images: [], startDate: self.eventObject.datetime, longitude: longitude, latitude: latitude, placeName: self.eventObject.eventPlaceName, host: self.eventObject.host)
                                            
                                            
                                            
                                            
                                        } // end DispatchQueue.main.async
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                            }
                        }
                        
                        
                    }
                    
                    if let error = error {
                        print("the error is \(error)")
                    }
                    
                    
                    
                }) // end task
                
                // if the task is suspended resume it.
                task.resume()
                
                
                let flashMessageController = UIAlertController(title: "Eventure", message: "Successfully Created Event", preferredStyle: UIAlertControllerStyle.alert)
                flashMessageController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(flashMessageController, animated: true, completion: nil)
                
                
                
            } // end of background thread.
            
            
            
            
            
        }
        
        
        
        
        
        
        

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "eventSuccess" {
            
            
            
            let successVC = (segue.destination as! MapViewController)
            
            
            
        }
        
        
    }
        
        
}
    
    
    

