//
//  GiftDetailViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 17/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class GiftDetailViewController: UIViewController {
    
    var gift: Gift!
    
    @IBOutlet var giftTitle: UILabel!
    @IBOutlet var giftImageView: UIImageView!
    
    @IBOutlet var giftAvailableAt: UILabel!
    @IBOutlet var giftPrice: UILabel!
    @IBOutlet var giftDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giftImageView.image = UIImage(named: gift.giftImage)
        giftTitle.text = gift.giftName
        giftPrice.text = "$" + String(gift.giftPrice)
        giftAvailableAt.text = gift.giftAvailableAt
        giftDescription.text = gift.giftDescription
        
        title = "My Gifts"
        
    }
    
}
    

