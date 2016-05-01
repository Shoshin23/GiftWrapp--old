//
//  DataService.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 26/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import Firebase


let BASE_URL = "https://giftwrapp.firebaseio.com/"

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(BASE_URL)")
    private var _REF_USERS = Firebase(url: "\(BASE_URL)").childByAppendingPath("users")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_USERS:Firebase {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT:Firebase {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        
        let user = Firebase(url:"\(BASE_URL)").childByAppendingPath("users").childByAppendingPath(uid)
        return user!
    }
    
    func createFirebaseUser(uid:String, user:Dictionary<String, AnyObject>) {
        
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}