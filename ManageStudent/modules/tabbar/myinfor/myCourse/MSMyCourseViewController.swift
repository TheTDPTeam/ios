//
//  MSMyCourseViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/21/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MSMyCourseViewController: UIViewController , IndicatorInfoProvider{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func initUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 220
        
        tableView.register(UINib.init(nibName: "MSMyCourseTableViewCell", bundle: nil), forCellReuseIdentifier: "MSMyCourseCell")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "My Course")
    }
}
extension MSMyCourseViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MSMyCourseCell", for: indexPath) as! MSMyCourseTableViewCell
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200.5
//    }
    
}
