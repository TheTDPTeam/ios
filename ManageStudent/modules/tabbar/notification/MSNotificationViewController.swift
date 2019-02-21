//
//  MSNotificationViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSNotificationViewController: UIViewController {
    @IBOutlet weak var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    func initUI() {
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self
        self.notificationTableView.rowHeight = UITableView.automaticDimension
        self.notificationTableView.estimatedRowHeight = 86
        self.notificationTableView.register(UINib.init(nibName: "MSNotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "MSNotificationTableViewCell")
        self.notificationTableView.register(UINib.init(nibName: "MSNotificationHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "MSNotificationHeaderView")
    }
    

}

extension MSNotificationViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MSNotificationHeaderView") as! MSNotificationHeaderView
        
        return customView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "MSNotificationTableViewCell", for: indexPath) as! MSNotificationTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.performSegue(withIdentifier: "showDetailNotification", sender: self)
    }
    
}
