//
//  Gift.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 17/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit


class Gift:NSObject {
    var giftName = " "
    var giftDescription = " "
    var giftPrice = 0
    var giftImage = " "
    var giftAvailableAt = " "
    var username = " "
    var postKey:String!

    init(giftName:String, giftPrice:Int, giftDescription:String, giftImage:String, giftAvailableAt: String,username:String,Timestamp:String) {
        self.giftName = giftName
        self.giftPrice = giftPrice
        self.giftDescription = giftDescription
        self.giftImage = giftImage
        self.giftAvailableAt = giftAvailableAt
        self.username = username
        
    }
    
    init(postKey:String?, dictionary: Dictionary<String, AnyObject>) {
        self.postKey = postKey
        
        if let giftName = dictionary["giftName"] as? String {
            self.giftName = giftName
        }
        
        if let giftDescription = dictionary["giftDescription"] as? String {
            self.giftDescription = giftDescription
        }
        
        if let giftPrice = dictionary["giftPrice"] as? Int {
            self.giftPrice = giftPrice
        }
        if let giftImage = dictionary["giftImage"] as? String {
            self.giftImage = giftImage
        }
        
        if let giftAvailableAt = dictionary["giftAvailableAt"] as? String {
            self.giftAvailableAt = giftAvailableAt
        }
        
        if let username = dictionary["username"] as? String {
            self.username = username
        }
        
        
        
    }
    
}
