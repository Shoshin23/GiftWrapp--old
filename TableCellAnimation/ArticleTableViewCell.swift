//
//  ArticleTableViewCell.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView:UIImageView!

    @IBOutlet var giftTitle: UITextView!
    @IBOutlet var availableAt: UILabel!
    @IBOutlet var giftDescription: UITextView!
    @IBOutlet var priceLabel: UILabel!
    
    var gift: Gift!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(gift: Gift) {
        self.gift = gift
        
        self.giftDescription.text = gift.giftDescription
        self.giftTitle.text = gift.giftName
        self.priceLabel.text = String(gift.giftPrice)
        self.availableAt.text = gift.giftAvailableAt
        
        ImageStore.downloadImage(gift.giftImage, afterDownloadImage: { image in
            self.postImageView.image = image
            self.postImageView.hidden = false
        
        })
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
