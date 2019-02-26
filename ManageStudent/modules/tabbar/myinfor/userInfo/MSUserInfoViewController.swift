//
//  MSUserInfoViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/17/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SVProgressHUD
import RxSwift
import RxCocoa

class MSUserInfoViewController: UIViewController , IndicatorInfoProvider {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var SaveInfoView: UIView!
    @IBOutlet weak var heightSaveInfoView: NSLayoutConstraint!
    
    var disposeBag = DisposeBag()
    var user : MSUser?
    var firstName  = Variable<String>("")
    var firstNameTemp : String?
    var lastName = Variable<String>("")
    var lastNameTemp :String?
    var phoneNumber = Variable<String>("")
    var phoneNumberTemp : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW5jb25ncGh1OThAZ21haWwuY29tIiwicm9sZXMiOlsiU1RVREVOVCJdLCJpYXQiOjE1NTExNjU5NzQsImV4cCI6MTU1MTE2OTU3NH0.XlT60CKwof0Sl0RIQ4DqqTlT2TZ7Ds3LpevfNatoVPo", forKey: "TOKEN")
        SVProgressHUD.show(withStatus: "Loading...")
        self.requestData()
        
    }

    @IBAction func LogOut(_ sender: Any) {
         UserDefaults.standard.set(nil, forKey: "LANGUAGE")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "My Info")
    }
    
    func requestData(){
        MSUserManager.shareInstance.fetchMyDetail { (data) in
            self.user = data
            self.emailTextField.text = data.email
            self.firstNameTextField.text = data.firstName
            self.lastNameTextField.text = data.lastName
            self.phoneTextField.text = data.phone
            self.lastNameTemp = data.lastName
            self.lastName.value = data.lastName!
            self.firstNameTemp = data.firstName
            self.firstName.value = data.firstName!
            self.phoneNumberTemp = data.phone
            self.phoneNumber.value = data.phone!
            self.requestDataToTextField()
            SVProgressHUD.dismiss()
        }
    }
    
    func requestDataToTextField() {
        
        firstNameTextField.rx.text
            .orEmpty
            .bind(to: firstName)
            .disposed(by: disposeBag)
        
        lastNameTextField.rx.text
            .orEmpty
            .bind(to: lastName)
            .disposed(by: disposeBag)
        
        phoneTextField.rx.text
            .orEmpty
            .bind(to: phoneNumber)
            .disposed(by: disposeBag)
        
        self.firstName.asObservable()
            .subscribe(onNext: { (numberString) in
                if self.firstName.value != ""{
                    if self.firstNameTemp != self.firstName.value {
                        if self.firstName.value != self.user?.firstName{
                            self.SaveInfoView.isHidden = false
                            self.firstNameTemp = self.firstName.value
                        } else {
                            self.SaveInfoView.isHidden = true
                            return
                        }
                    } else {
                        self.SaveInfoView.isHidden = true
                        return
                    }
                } else {
                    return
                }
            }).disposed(by: self.disposeBag)
        
        self.lastName.asObservable()
            .subscribe(onNext: { (numberString) in
                 if self.lastName.value != ""{
                    if self.lastNameTemp != self.lastName.value {
                        if self.lastName.value != self.user?.firstName{
                            self.SaveInfoView.isHidden = false
                            self.lastNameTemp = self.lastName.value
                        } else {
                            self.SaveInfoView.isHidden = true
                            return
                        }
                    } else {
                        self.SaveInfoView.isHidden = true
                        return
                    }
                 } else {
                    return
                }
            }).disposed(by: self.disposeBag)
        
        self.phoneNumber.asObservable()
            .subscribe(onNext: { (numberString) in
                if self.phoneNumber.value != ""{
                    if self.phoneNumberTemp != self.phoneNumber.value {
                        if self.phoneNumber.value != self.user?.firstName{
                            self.SaveInfoView.isHidden = false
                            self.phoneNumberTemp = self.phoneNumber.value
                        } else {
                            self.SaveInfoView.isHidden = true
                            return
                        }
                    } else {
                        self.SaveInfoView.isHidden = true
                        return
                    }
                } else {
                    return
                }
            }).disposed(by: self.disposeBag)
    }
    
    @IBAction func activeChangePassword(_ sender: Any) {
        
    }
    
    @IBAction func acceptSaveInfo(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Loading...")
        MSUserManager.shareInstance.UpdateDetail(firstName: self.firstName.value, lastName: self.lastName.value, phone: self.phoneNumber.value, completion: { (user) in
            self.user = user
            self.emailTextField.text = user.email
            self.firstNameTextField.text = user.firstName
            self.lastNameTextField.text = user.lastName
            self.phoneTextField.text = user.phone
            SVProgressHUD.dismiss()
        }) {
        }
    }
    
    @IBAction func cancelSaveInfo(_ sender: Any) {
        self.emailTextField.text = self.user!.email
        self.firstNameTextField.text = self.user?.firstName
        self.lastNameTextField.text = self.user?.lastName
        self.phoneTextField.text = self.user?.phone
    }
    
}
