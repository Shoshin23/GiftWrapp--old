//
//  MaterialView.swift
//  GiftWrapp
//
//  Created by Karthik Kannan on 18/04/16.
//  Copyright © 2016 Lotus//Bee. All rights reserved.
// This is for Material Design View. Creates a shadow. courtesy of the nice guy at DevSlopes

import UIKit


class MaterialView: UIView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }
    
}
