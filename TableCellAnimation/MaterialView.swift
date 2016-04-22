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
        layer.shadowColor = UIColor(red:0.29, green:0.73, blue:0.89, alpha:1.0).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }
    
}
