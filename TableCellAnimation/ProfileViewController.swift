//
//  ProfileViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 01/05/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase


class ProfileViewController: UIViewController {

    @IBOutlet var profileName: UILabel!
    @IBOutlet var profileImage: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let profileName = DataService.ds.REF_USER_CURRENT.childByAppendingPath("displayName")
        profileName.observeEventType(.Value, withBlock: { snapshot in
            self.profileName.text = snapshot.value! as? String
        
        })
        
        let profileImage = DataService.ds.REF_USER_CURRENT.childByAppendingPath("imageURL")
        
        profileImage.observeEventType(.Value, withBlock: { snapshot in
            let url = NSURL(string: snapshot.value! as! String)
            let data = NSData(contentsOfURL: url!)
            self.profileImage.image = UIImage(data: data!)
            self.profileImage.contentMode = .ScaleAspectFit
            
        })
    
    
    
    }
}
