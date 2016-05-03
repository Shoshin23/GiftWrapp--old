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


class AddGiftViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
    }
    
    
    
    @IBAction func savePost(sender: UIButton) {
        
        
        
        
    }
    

}
