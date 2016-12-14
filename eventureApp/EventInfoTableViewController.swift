//
//  EventInfoTableViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
class EventInfoTableViewController: UITableViewController {
    
    
    var eventObject: addEvent!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var hostName: UITextField!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var locationField: UITextField!
    override func viewDidLoad() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendEventInfo" {
            
            
            eventObject.title = self.titleField.text!
            eventObject.description = self.descriptionField.text!
            eventObject.location = self.locationField.text!
            eventObject.eventPlaceName = self.placeName.text!
            self.eventObject.host = hostName.text!
            
            let catVC = (segue.destination as! CategoryTableViewController)
            
            catVC.eventObject = eventObject
            
            
        }
        
        
    }
    
    
    
}

