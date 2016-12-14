//
//  ChatViewController.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/13/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth



class ChatViewController: UIViewController {

    @IBOutlet weak var chatTextField: UITextField!
    var roomId: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func send(_ sender: Any) {
        
        let ref = FIRDatabase.database().reference()
        let db = DBAccessObject(DBAccessObj: ref)
        
        let roomId = ref.child("rooms").child("-KYu-2Jz_nnEQdKjJkm0")
        
        db.CreateNewMessage(userId: (FIRAuth.auth()?.currentUser?.uid)!, roomId: roomId , textMessage: chatTextField.text!)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
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
