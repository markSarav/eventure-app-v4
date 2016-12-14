//
//  RoomCollectionViewController.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/12/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

private let reuseIdentifier = "Cell"


class RoomCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    @IBAction func refresh(_ sender: Any) {
        
        self.collectionView?.reloadData()
        
    }
    var room: addRoom!
    var serverRoom: Room!
    var rooms = [Room]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        let keyRef = ref.child("rooms").key
        let roomRef = ref.child("rooms").observe(.childAdded, with: { (snapshot) in
            
            
            
            
            
            self.serverRoom = Room(key: snapshot.key, snapshot: snapshot.value as! Dictionary<String, AnyObject>)
            
        
            self.rooms.append(self.serverRoom)
            let indexPath = NSIndexPath(item: self.rooms.count - 1, section: 0)
            
            if self.rooms.count == 1 {
                
            
           
                self.collectionView?.insertItems(at: [indexPath as IndexPath])
                
               
                
                
            }

            
        })
        
        
        
        //print("THE ROOM CAPTION IS \(room.caption)")
        

    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return rooms.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roomCell", for: indexPath) as! RoomCollectionViewCell
        let room = rooms[indexPath.row]
        // Configure the cell
        cell.configureCell(room: serverRoom)
    
        return cell
    }
    
   


   
}
