//
//  MSUserManager.swift
//  ManageStudent
//
//  Created by tri minh on 1/8/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MSUserManager {
    
    static let shareInstance = MSUserManager()
    
    func logInUser(username: String,
                   password: String,
                   completion: @escaping (String)-> Swift.Void,
                   failure: @escaping ()-> Swift.Void) {
        let params: Parameters = ["email":username,
                      "password":password]
        MSBaseRequestManager.shareInstance.post(url: SERVER_REQUEST_URL + REQUEST_ACCOUNT_LOGIN, params: params, completion: { (user) in
            let value = user as! [String :Any]
            completion(value["token"] as! String)
        }) { (error) in
            NSLog(error ?? "")
        }
    }
}
