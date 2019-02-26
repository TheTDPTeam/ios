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
import ObjectMapper

class MSUserManager {
    
    static let shareInstance = MSUserManager()
    var listSemester = [MSSemester]()
    
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
    
    func UpdateDetail(firstName: String,
                      lastName: String,
                      phone: String,
                      completion: @escaping (MSUser)-> Swift.Void,
                      failure: @escaping ()-> Swift.Void) {
        let params: Parameters = ["firstName":firstName,
                                  "lastName":lastName,
                                  "phone":phone]
        MSBaseRequestManager.shareInstance.post(url: SERVER_REQUEST_URL + REQUEST_UPDATE_DETAIL, params: params, completion: { (user) in
            let course = Mapper<MSUser>().map(JSON: user as! [String : Any])
            completion(course!)
        }) { (error) in
            NSLog(error ?? "")
        }
    }

    func fetchMyDetail(completion: @escaping (MSUser) -> Swift.Void) {
        MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_MY_DETAILS, params: nil, completion: { (JSON) in
            let myDetail = Mapper<MSUser>().map(JSON: JSON as! [String : Any])
            completion(myDetail!)
        }) { (error) in
            NSLog("My Detail ERROR :\(error ?? "")")
        }
    }
    
    func fetchMyCourse(completion: @escaping ([MSSemester]) -> Swift.Void) {
        MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_MY_COURSE, params: nil, completion: { (JSON) in
            let data = JSON as! NSArray
            for item in data {
                let course = Mapper<MSSemester>().map(JSON: item as! [String : Any])
                self.listSemester.append(course!)
            }
            completion(self.listSemester)
        }) { (error) in
            NSLog("STAFF ERROR :\(error ?? "")")
        }
    }
    
}
