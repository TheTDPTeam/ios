//
//  MSMyCourseViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/21/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
import ObjectMapper
import SVProgressHUD

class MSMyCourseViewController: UIViewController , IndicatorInfoProvider{
    
    @IBOutlet weak var tableView: UITableView!
    var listSemester = [MSSemester]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show(withStatus: "Loading...")
        self.initUI()
        self.configDataMyDetail()
    }
    
    func initUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 220
        
        tableView.register(UINib.init(nibName: "TLABillSummaryHeaderView", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "TLABillSummaryHeaderView")
        tableView.register(UINib.init(nibName: "MSMyCourseTableViewCell", bundle: nil), forCellReuseIdentifier: "MSMyCourseTableViewCell")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "My Course")
    }
    
    func configDataMyDetail()  {
        MSUserManager.shareInstance.fetchMyCourse { (listSemester) in
            self.listSemester = listSemester
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
}
extension MSMyCourseViewController: UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if  self.listSemester.count != 0 {
            return self.listSemester.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TLABillSummaryHeaderView") as! TLABillSummaryHeaderView
        cell.billName.text = self.listSemester[section].semesterName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.listSemester.count != 0 {
            return self.listSemester[section].subjects.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MSMyCourseTableViewCell", for: indexPath) as! MSMyCourseTableViewCell
        cell.configDataCell(subject: self.listSemester[indexPath.section].subjects[indexPath.row])
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200.5
//    }
    
}
