//
//  CategoryTableViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    var eventObject: addEvent!
    
    let data = ["Recreational", "Business", "Charitable", "Food/Drink"]
    
    override func viewDidLoad() {
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        print("THE DESCRIPTION IS \(eventObject.description)")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.eventObject.category = data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendCategoryInfo" {
            
            let dateTableVC = (segue.destination as! DateTableViewController)
            dateTableVC.eventObject = eventObject
            
        }
    }
    
    
    
}
