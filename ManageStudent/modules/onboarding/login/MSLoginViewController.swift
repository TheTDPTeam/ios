//
//  MSLoginViewController.swift
//  ManageStudent
//
//  Created by tri minh on 1/5/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

class MSLoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var notifiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        
    }
    
    func initUI() {
        notifiLabel.text = nil
        usernameLabel.attributedPlaceholder = NSAttributedString(string: "Please enter username",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordLabel.attributedPlaceholder = NSAttributedString(string: "Please enter password",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    @IBAction func SignInActive(_ sender: Any) {
        switch (self.usernameLabel.text , self.passwordLabel.text) {
        case ("" , ""):
            self.animationErrorMessage(title: "*Please enter username & password!")
            break
        case (_ , ""):
            self.animationErrorMessage(title: "*Please enter password!")
            break
        case ("" , _):
            self.animationErrorMessage(title: "*Please enter username!")
            break
        default:
            MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_ACCOUNT_STUDENT, params: nil
                , completion: { (data) in
                    print("\(data as! String)")
            }) { (error) in
                NSLog(error ?? "")
            }
//            self.switchTabbarView()
//            MSUserManager.shareInstance.logInUser(username: self.usernameLabel.text!, password: self.passwordLabel.text!, completion: {
//                print("hello")
//            }) {
//                print("error")
//            }
            break
        }
    }

    func animationErrorMessage(title: String) {
        //first, show Text Error:
        UIView.animate(withDuration: 0.0) {
            self.notifiLabel.text = "\(title)"
            self.notifiLabel.isHidden = false
        }
        //second, show animation damping
        UIView.animate(withDuration: 0.7, delay: 0.05, usingSpringWithDamping: 0.05, initialSpringVelocity: 0.1, options: [], animations: {
            self.notifiLabel.bounds.size.width += 10.0
        }, completion: nil)
        self.notifiLabel.bounds.size.width -= 10.0
    }
    
    func switchTabbarView() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchTabbar()
    }

}

