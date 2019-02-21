//
//  MSUserInfoViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class MSUserInfoViewController: UIViewController , IndicatorInfoProvider {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var SaveInfoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestData()
    }


    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "My Info")
    }
    
    func requestData(){
        MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_MY_DETAILS, params: nil
            , completion: { (data) in
                print("\(data as! String)")
        }) { (error) in
            NSLog(error ?? "")
        }
    }
}
