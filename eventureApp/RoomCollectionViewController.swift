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

    var rooms = [Room]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        let db = DBAccessObject(DBAccessObj: ref)
        
        db.fetchDataFromServer { (room) in
            self.rooms.append(room)
            let indexPath = NSIndexPath(item: self.rooms.count - 1, section: 0)
            self.collectionView?.insertItems(at: [indexPath as IndexPath])
        }
        
        

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
        cell.configureCell(room: room)
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var width = view.frame.size.width
        width = width/2
        width = width - 5
        
        var width2 = view.frame.size.width
        width2 = width/2
        width2 = width2 - 5
        
        return CGSize(width: width, height: width2)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
