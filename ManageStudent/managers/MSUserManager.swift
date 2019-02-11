//
//  MSUserManager.swift
//  ManageStudent
//
//  Created by tri minh on 1/8/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import Alamofire

class MSUserManager {
    
    static let shareInstance = MSUserManager()
    
//    func logInUser(username: String,
//                   password: String,
//                   completion: @escaping ()-> Swift.Void,
//                   failure: @escaping ()-> Swift.Void) {
//        let params = ["username":username,
//                      "password":password] as [String : Any]
//        MSBaseRequestManager.shareInstance.post(url: SERVER_REQUEST_URL + REQUEST_ACCOUNT_LOGIN, params: params, completion: { (user) in
//            NSLog("DATA \(user ?? "")")
//            completion()
//        }) { (error) in
//            NSLog(error ?? "")
//        }
//    }
}
