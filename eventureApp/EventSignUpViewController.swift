//
//  EventSignUpViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 11/29/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EventSignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // listen to the database and add the current user to the events attendees list.
        
        var ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        
        // select the attendees child
        var eventRef = ref.child("Events").childByAutoId().key
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
