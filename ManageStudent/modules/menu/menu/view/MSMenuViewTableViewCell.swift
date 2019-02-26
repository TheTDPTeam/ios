//
//  MSMenuViewTableViewCell.swift
//  ManageStudent
//
//  Created by tri minh on 2/19/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSMenuViewTableViewCell: UITableViewCell {
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
