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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil {
            self.performSegueWithIdentifier("loggedIn", sender: nil)
        }
    }
    
    
    @IBAction func fbButtonPressed(sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
            
            if facebookError != nil {
                print("Login failed")
            } else {
                
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Logged in \(accessToken)")
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                    
                    if error != nil {
                        print("log in failed \(error)")
                    }
                    else {
                        print("Logged in \(authData)")
                        
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                        
                        let user = ["provider":authData.provider!,"displayName":authData.providerData["displayName"]!,"cachedProfile":authData.providerData["cachedUserProfile"]!, "imageURL":authData.providerData["profileImageURL"]!]
                        
                        DataService.ds.createFirebaseUser(authData.uid, user: user)
                        
                        self.performSegueWithIdentifier("loggedIn", sender: nil)
                    }
                    
                })
                
            }
            
        }
    }
   

}
