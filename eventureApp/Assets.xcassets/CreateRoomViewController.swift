//
//  CreateRoomViewController.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/12/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit
import Firebase

class CreateRoomViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var captionLBL: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPhoto: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(CreateRoomViewController.dismissKeyboard))
        dismissKeyboard.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismissKeyboard)
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(imageTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    func dismissKeyboard(tap:UITapGestureRecognizer){
        view.endEditing(true)
    }
    @IBAction func CreateRoomDidTapped(_ sender: Any) {
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        let db = DBAccessObject(DBAccessObj: ref)
        let data: NSData = NSData()
        db.CreateNewRoom(user: (FIRAuth.auth()!.currentUser)!, caption: captionLBL.text!, data: data)
        
    }
   /* @IBAction func SelectPhotoDidTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
    }*/
    
    func imageTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage: UIImage?
        if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
        }
        
        if let newImage = selectedImage{
            imageView.image = newImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func GoBackDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
