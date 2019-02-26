//
//  MSMyCourseTableViewCell.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSMyCourseTableViewCell: UITableViewCell {
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var theoryLabel: UILabel!
    @IBOutlet weak var practiceLabel: UILabel!
    @IBOutlet weak var rollCallLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configDataCell(subject: MSSubject) {
        self.subjectLabel.text = subject.subjectName ?? ""
        self.theoryLabel.text = String(subject.theoryScore!)
        self.practiceLabel.text = String(subject.practicalScore!)
        self.rollCallLabel.text = subject.attendingRate
        self.statusLabel.text = subject.success ?? false ? "PASS" : "FALSE"
        self.statusLabel.textColor = subject.success ?? false ? UIColor.red : UIColor(displayP3Red: 0/255, green: 191/255, blue: 0/255, alpha: 1.0)
        self.statusImg.image = subject.success ?? false ? UIImage(named: "UI_check") : UIImage(named: "UI_cancel")
    }
    
}
