//
//  DateTableViewController.swift
//  eventureApp
//
//  Created by Lucas Padden on 12/10/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit

class DateTableViewController: UITableViewController {
    
    var eventObject: addEvent!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    
    override func viewDidLoad() {
        print("The category is \(eventObject.category)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "eventSuccess"{
            
            
            var formatter = DateFormatter()
            formatter.dateFormat = "MM dd, YYYY"
            eventObject.datetime = formatter.string(from: datePickerView.date)
            
            let successVC = (segue.destination as! EventSuccessViewController)
            successVC.eventObject = eventObject
            
            
        }
        
        
    }
    
    
}
