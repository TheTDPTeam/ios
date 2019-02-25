//
//  MSBaseRequestManager.swift
//  ManageStudent
//
//  Created by tri minh on 1/5/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit
import Alamofire

class MSBaseRequestManager  {
    static let shareInstance = MSBaseRequestManager()
   
    func get(url: String,
             params: [String : Any]?,
             completion: @escaping (Any?) -> Swift.Void,
             failure: @escaping (String?) -> Swift.Void) {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "TOKEN") ?? "")",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            Alamofire.request(url, method: .get, parameters: params, headers: headers).responseJSON { (response) in
                if response.result.value != nil {
                    completion(response.result.value)
                } else {
                    failure("aaaa")
                }
            }
    }
    
    
    
    func post(url: String,
              params: [String : Any]?,
              completion: @escaping (Any?) -> Swift.Void,
              failure: @escaping (String?) -> Swift.Void) {
        if UserDefaults.standard.string(forKey: "TOKEN") != nil {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "TOKEN") ?? "")",
            ]
            Alamofire.request(url, method: .post, parameters: params, headers: headers).responseJSON(completionHandler: { (response) in
                if response.result.value != nil {
                    completion(response.result.value)
                } else {
                    failure(response.result.value as? String)
                }
            })
        }
            Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding(options: [])).responseJSON(completionHandler: { (response) in
                if response.result.value != nil {
                    completion(response.result.value)
                } else {
                    failure(response.result.value as? String)
                }
            })
    }
}
