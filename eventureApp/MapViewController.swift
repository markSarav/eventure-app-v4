//
//  MapViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 10/25/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseCore
import FirebaseInstanceID


class MapViewController: UIViewController {

    @IBOutlet weak var AddEventView: UIView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var myMapView: GMSMapView!
    
    
    @IBAction func goToChat(_ sender: AnyObject) {
        
    }
    
    
    @IBAction func addEvent(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 1) {
            self.AddEventView.center = CGPoint(x: self.AddEventView.center.x + 500,y: self.AddEventView.center.y)
            
        }
        
    }
    
    override func viewDidLoad() {
        
        AddEventView.center = CGPoint(x: AddEventView.center.x - 500, y: AddEventView.center.y)
        
    }
    
    @IBAction func back(_ sender: AnyObject) {
        
        
        UIView.animate(withDuration: 1) {
            self.AddEventView.center = CGPoint(x: self.AddEventView.center.x - 500,y: self.AddEventView.center.y)
        }
        
    }
    
    @IBAction func logout(_ sender: AnyObject) {
        let firebaseUser = FIRAuth.auth()
        
        do {
            try firebaseUser!.signOut()
            
            //Send the user back to login screen after logging out
            let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")
                present(loginVC, animated: true, completion: nil)
            
            
        } catch let signoutError as NSError {
            print ("Error signing out \(signoutError)")
        }
        
    }
    
}

