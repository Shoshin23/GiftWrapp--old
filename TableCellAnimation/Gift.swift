//
//  Gift.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 17/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit


class Gift:NSObject {
    var giftName: String
    var giftDescription: String
    var giftPrice: Int
    var giftImage: String
    var giftAvailableAt: String
    
    init(giftName:String, giftPrice:Int, giftDescription:String, giftImage:String, giftAvailableAt: String) {
        self.giftName = giftName
        self.giftPrice = giftPrice
        self.giftDescription = giftDescription
        self.giftImage = giftImage
        self.giftAvailableAt = giftAvailableAt
    }
    
}
