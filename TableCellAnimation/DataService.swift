//
//  DataService.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 26/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import Firebase


class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://giftwrapp.firebaseio.com/")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}