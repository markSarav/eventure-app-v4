//
//  ViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 10/22/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var name: UITextField!
    
    
    @IBAction func login(_ sender: AnyObject) {
        
        // log in a already registered user
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!) {
            (user, error) in
            /*
            if let err = error {
                
            }
            */
            if error != nil {
                print("Error logging user")
                print(error.debugDescription)
                return
            }
            
            print("Logged in \(user?.email)")
            self.email.text = ""
            self.password.text = ""
            
            
            // redirect to loggedInViewController... programmatically...
            self.performSegue()
            
        }
        
            
        
        
    }
    
    
    //Handles segue actions for both login and register.
    private func performSegue() {
        self.performSegue(withIdentifier: "authenticationSegue", sender: nil)
    }
    
    
    
    // add to database
    var ref: FIRDatabaseReference = FIRDatabase.database().reference()
    
    
    @IBAction func register(_ sender: AnyObject) {
    
        guard let email = email.text,  let password = password.text, let name = name.text else {
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                return
            }
            
            // succesfully authenticated user.
            
            guard let uid = user?.uid else {
                return
            }
            
            // save user to database
            let ref = FIRDatabase.database().reference()
            let usersReference = ref.child("Users").child(uid)
            let values = ["name": name, "email": email]
            
            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil {
                    return
                }
                
            })
            
            
        })
        
        // reset the text field.
        self.email.text = ""
        self.password.text = ""
        self.name.text = ""

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    }
    



}

