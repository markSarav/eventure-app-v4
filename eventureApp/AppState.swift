//
//  AppState.swift
//  eventureApp
//
//  Created by Mark Saravia on 12/9/16.
//  Copyright © 2016 eventure-app. All rights reserved.
//

import UIKit

class AppState: NSObject {
    
    static let sharedInstance = AppState()
    
    var signedIn = false
    var displayName: String?

}
