//
//  MSMenuViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSMenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    var data = [
                DataUser(title:"Course",description:"Sunt tenetur, ut perferendis ante quos rerum maiores purus sociis soluta tenetur dapibus a molestie?"),
                DataUser(title:"Calendar",description:"Sunt tenetur, ut perferendis ante quos rerum maiores purus sociis soluta tenetur dapibus a molestie?"),
                DataUser(title:"Contact",description:"Sunt tenetur, ut perferendis ante quos rerum maiores purus sociis soluta tenetur dapibus a molestie?")
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
       
    }
    
    func initUI() {
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
        self.menuTableView.register(UINib.init(nibName: "MSMenuViewTableViewCell",bundle: Bundle.main), forCellReuseIdentifier: "MSMenuViewTableViewCell")
    }
    
//    func switchCourseVC() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.switchCourseVC()
//    }
//    
//    func switchCalendarVC() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.switchCalendarVC()
//    }
//    
//    func switchContactVC() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.switchContactVC()
//    }
    
}

extension MSMenuViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MSMenuViewTableViewCell", for: indexPath) as! MSMenuViewTableViewCell
        cell.titileLabel.text = data[indexPath.row].title
        cell.descriptionLabel.text = data[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if indexPath.row == 0 {
            appDelegate.switchCourseVC()
        } else if indexPath.row == 1 {
             appDelegate.switchCalendarVC()
        } else if indexPath.row == 2 {
            appDelegate.switchContactVC()
        }
    }
    
    
}
