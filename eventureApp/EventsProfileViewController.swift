//
//  EventsProfileViewController.swift
//  eventureApp
//
//  Created by Marco Roveto on 11/8/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class EventsProfileViewController: UIViewController {
    
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var eventDescription: UILabel!
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventTime: UILabel!
    @IBOutlet var eventHost: UILabel!
    @IBOutlet var eventLocationAddress: UILabel!
    @IBOutlet var eventPlaceName: UILabel!
    
    
    @IBOutlet var signUpButton: UIButton!
//    @IBOutlet var eventTitle: UILabel!
//    @IBOutlet var eventDescription: UILabel!
//    @IBOutlet var eventCategory: UILabel!
    
    var eventId: String!
    var myUserId = FIRAuth.auth()?.currentUser?.uid
    
    
    @IBAction func signUpForEventButton(_ sender: Any) {
        
        addMyselfToEvent(withEventId: eventId)
        
        // Programmatically perform segue. in case the sign up was unsuccessful.
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This is for the design of the button
        signUpButton.layer.borderColor = UIColor.black.cgColor
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.cornerRadius = 12
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //        FIRDatabase.database().reference().child("Events").child(
        
        //print(eventId)
        
        FIRDatabase.database().reference().child("Events").child(eventId).observe(.value, with: { (snapshot) in
            let dictionary = snapshot.value as? Dictionary<String, AnyObject>
            //print(dictionary)
            
            let eventTitle = dictionary?["title"] as? String
            self.eventTitle.text = eventTitle
            
            //let eventImage = dictionary?["eventImage"] as? String
            //self.eventImage.image = eventImage
            
            let eventDescription = dictionary?["description"] as? String
            self.eventDescription.text = eventDescription
            
            let eventDate = dictionary?["startDate"] as? String
            self.eventDate.text = eventDate
            
            let eventTime = dictionary?["eventTime"] as? String
            self.eventTime.text = eventTime
            
            let eventHost = dictionary?["eventHost"] as? String
            self.eventHost.text = "Hosted by: " + eventHost!
            
            let eventLocationAddress = dictionary?["eventLocationAddress"] as? String
            self.eventLocationAddress.text = eventLocationAddress
            
            let eventPlaceName = dictionary?["eventPlaceName"] as? String
            self.eventPlaceName.text = eventPlaceName
            
        })
 
    }
    
    
    
    func addMyselfToEvent(withEventId eventId: String) {
        //Grabes current event by ID then adds the current user into the attendees list.
        FIRDatabase.database().reference().child("Events").child(eventId).child("attendees").child(myUserId!).setValue(true)
        // After function is ran the segue will execute progromatticly
        self.performSegue(withIdentifier: "SignupSuccessSegue", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
