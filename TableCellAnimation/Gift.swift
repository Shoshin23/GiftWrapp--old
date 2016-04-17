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
    
    init(giftName:String, giftPrice:Int, giftDescription:String, giftImage:String, giftAvailableAt: String) {
        self.giftName = giftName
        self.giftPrice = giftPrice
        self.giftDescription = giftDescription
        self.giftImage = giftImage
        self.giftAvailableAt = giftAvailableAt
    }
    
}
