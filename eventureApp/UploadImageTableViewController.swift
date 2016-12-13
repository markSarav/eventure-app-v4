//
//  UploadImageTableViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit

import UIKit
import FirebaseStorage

class UploadImageTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageToSend: UIImage = UIImage()
    var event: Event!
    
    override func viewDidLoad() {
        
        view.addSubview(eventProfileImage)
        setupEventProfileImage()
        
    }
    
    func setupEventProfileImage() {
        
        eventProfileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        eventProfileImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        eventProfileImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    lazy var eventProfileImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "eventImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleEventProfileImage)))
        imageView.isUserInteractionEnabled = true
        
        self.imageToSend = imageView.image!
        
        return imageView
    }()
    
    func handleEventProfileImage() {
        
        
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            eventProfileImage.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadPhotoHandler(_ sender: Any) {
        
        var imageName = NSUUID().uuidString
        
        //        let storageRef = FIRStorage.storage().reference().child("\(imageName).png")
        //
        //        if let uploadData = UIImagePNGRepresentation(self.eventProfileImage.image!) {
        //
        //            storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
        //
        //                if error != nil {
        //
        //                }
        //                else {
        //                    return
        //                }
        //
        //
        //
        //            })
        //
        //        }
        
        // prepare for segue
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventInfo" {
            
            
            var event: addEvent
            let eventInfoVC = (segue.destination as! EventInfoTableViewController)
            event = addEvent(image: imageToSend, title: "", description: "", location: "", category: "", datetime: "")
            print("THE EVENTS IMAGE IS \(event.image)")
            eventInfoVC.eventObject = event
            
            
            
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    //        
    //        
    //        
    //        
    //        return cell
    //        
    //    }
    
    
    
}
