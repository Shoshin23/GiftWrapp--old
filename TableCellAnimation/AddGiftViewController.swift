//
//  AddGiftViewController.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 02/05/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import Alamofire


class AddGiftViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var imagePicker: UIImagePickerController!
    

    
    @IBOutlet var giftName: UITextField!
    
    @IBOutlet var giftAvailableAt: UITextField!
    
    @IBOutlet var giftDescription: UITextView!
    
    @IBOutlet var giftPrice: UITextField!
    
    @IBOutlet var giftImageView: UIImageView!
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        giftImageView.image = image
    }
    
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        
        print("SelectImage Tapped")
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        print("In AddGiftVC")
        
        self.giftName.delegate = self
        self.giftPrice.delegate = self
        self.giftDescription.delegate = self
        self.giftAvailableAt.delegate = self
        
        
    }
    
    func postToFirebase(imgUrl: String) {
        var gift: Dictionary<String, AnyObject> = [
            "giftName": giftName.text!,
            "giftDescription":giftDescription.text!,
            "giftAvailableAt": giftAvailableAt.text!,
            "giftPrice": Int(giftPrice.text!)!,
            "username": NSUserDefaults.standardUserDefaults().valueForKey("uid")!,
            "giftImage":imgUrl
        ]
        
        let firebasePost = DataService.ds.REF_POSTS.childByAutoId()
        firebasePost.setValue(gift)
        
        firebasePost.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if let postID = snapshot.key {
                DataService.ds.REF_USER_CURRENT.childByAppendingPath("posts").childByAppendingPath(postID).setValue(true)
            }
        
        })
        
       self.giftAvailableAt.text = ""
       self.giftDescription.text = ""
       self.giftPrice.text = ""
       self.giftName.text = ""
        

        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
   
    
    
    @IBAction func savePost(sender: UIButton) {
        
        let defaultImg = UIImage(named: "LotusBee Logo v1")!

        
        if let img = giftImageView.image {
            if !img.isEqual(defaultImg) {
                ImageStore.uploadImage(img, afterUploadImage: { imageLink in
                    self.postToFirebase(imageLink)
                })
            } else {
                print("Upload failed")
                self.postToFirebase("")
            }
            
        } else {
            print("upload failed")
            self.postToFirebase("")
        }
        
        
        
        
    }
    



}
