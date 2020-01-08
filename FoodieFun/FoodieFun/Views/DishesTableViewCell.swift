//
//  DishesTableViewCell.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/7/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import UIKit

class DishesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dishTableImageView: UIImageView!
    @IBOutlet weak var dishTableNameLabel: UILabel!
    @IBOutlet weak var dishTableReviewPreviewTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
