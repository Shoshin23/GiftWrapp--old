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
    @IBOutlet var giftDescription: UILabel!
    @IBOutlet var giftPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giftTitle.text = gift.giftName
        giftPrice.text = String(gift.giftPrice)
        giftDescription.text = gift.giftDescription
        giftImageView.image = UIImage(named: gift.giftImage)
        
        
    }

}
