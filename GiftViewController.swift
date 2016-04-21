//
//  GiftViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 21/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var tableView: UITableView!
        
        var gifts:[Gift] = [Gift(giftName:"Hello", giftPrice: 34, giftDescription: "Hello World",giftImage: "GiftWrapp Logo", giftAvailableAt: "Amazon"), Gift(giftName: "Freitag RocketRucksack Bag", giftPrice: 56, giftDescription: "Lorem ipsum dolor sit amet, vix at illud zril. Ei per labore percipitur, et graeci eripuit vel. Quod interpretaris vis eu, nam ne clita legimus. Viris quaerendum id vis. Nec ex mollis contentiones, ne probo imperdiet sed.", giftImage: "bts", giftAvailableAt: "Amazon")]
        
        
        
        
        var postShown = [Bool](count: 6, repeatedValue: false)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.tableFooterView = UIView(frame: CGRectZero)
            tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
                240.0/255.0, alpha: 0.8)
            print("In GiftViewController")
            
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "My Gifts", style: .Plain, target: nil, action: nil)
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // MARK: - Table view data source
        
         func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            // Return the number of sections.
            return 1
        }
        
         func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Return the number of rows in the section.
            return gifts.count
        }
        
        
         func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ArticleTableViewCell
            
            // Configure the cell...
            cell.titleLabel.text = gifts[indexPath.row].giftName
            cell.priceLabel.text = String(gifts[indexPath.row].giftPrice) //convert price to String to display in tha label.
            cell.giftDescription.text = gifts[indexPath.row].giftDescription
            cell.availableAt.text = gifts[indexPath.row].giftAvailableAt
            cell.postImageView.image = UIImage(named: gifts[indexPath.row].giftImage)
            
            
            return cell
        }
        
         func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
            
            // Determine if the post is displayed. If yes, we just return and no animation will be created
            if postShown[indexPath.row] {
                return
            }
            
            // Indicate the post has been displayed, so the animation won't be displayed again
            postShown[indexPath.row] = true
            
            // Define the initial state (Before the animation)
            cell.alpha = 0
            // Define the final state (After the animation)
            UIView.animateWithDuration(1.0, animations: { cell.alpha = 1 })
            
            //        // Define the initial state (Before the animation)
            //        let rotationAngleInRadians = 90.0 * CGFloat(M_PI/180.0)
            //        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
            //        cell.layer.transform = rotationTransform
            //
            //        // Define the final state (After the animation)
            //        UIView.animateWithDuration(1.0, animations: { cell.layer.transform = CATransform3DIdentity })
        }
        
        
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showGift" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let destinationController = segue.destinationViewController as! GiftDetailViewController
                    
                    destinationController.gift = gifts[indexPath.row]
                }
            }
        }
        
    }



