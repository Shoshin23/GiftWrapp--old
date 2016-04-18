//
//  GiftDetailViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 17/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class GiftDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var gift: Gift!
    
    @IBOutlet var giftImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        giftImageView.image = UIImage(named: gift.giftImage)
        
        title = gift.giftName
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! GiftDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = gift.giftName
        case 1:
            cell.fieldLabel.text = String(gift.giftPrice)
        case 2:
            cell.fieldLabel.text = gift.giftDescription
        case 3:
            cell.fieldLabel.text = gift.giftAvailableAt
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell }
    
    
    

}
