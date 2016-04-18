//
//  GiftDetailViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 17/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class GiftDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var gift: Gift!
    
    @IBOutlet var giftImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // giftImageView.image = UIImage(named: gift.giftImage)
        
        title = gift.giftName
        print("In DetailView Controller")
        
//        tableView.estimatedRowHeight = 36.0
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
    }
    
}
    

