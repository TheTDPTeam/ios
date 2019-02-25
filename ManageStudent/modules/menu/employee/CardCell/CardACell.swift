//
//  CardACell.swift
//  MMCardView
//
//  Created by MILLMAN on 2016/9/21.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import MMCardView

class CardACell: CardCell {
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var localEmployee: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configCell(data: MSStaff) {
        self.fullNameLabel.text = data.fullName
        self.emailLabel.text = data.email
        self.phoneLabel.text = data.phoneNumber
    }
}
