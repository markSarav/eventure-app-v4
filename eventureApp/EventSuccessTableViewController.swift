//
//  EventSuccessTableViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth


class EventSuccessViewController: UIViewController {
    
    var eventObject: addEvent!
    var imageName: String!
    
    override func viewDidLoad() {
                
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let homeVC = (segue.destination as! MapViewController)
        
        
    }
    
}
