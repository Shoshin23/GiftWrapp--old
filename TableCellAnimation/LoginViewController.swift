//
//  LoginViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 26/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func fbButtonPressed(sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
            
            if facebookError != nil {
                print("Login failed")
            } else {
                
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Logged in \(accessToken)")
            }
            
        }
    }
   

}
