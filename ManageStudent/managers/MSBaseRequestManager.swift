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
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNaW5odHJpdHJ1b25nMDIwOUBnbWFpbC5jb20iLCJyb2xlcyI6WyJURUFDSEVSIl0sImlhdCI6MTU0NzA0ODkyMywiZXhwIjoxNTQ3MDUyNTIzfQ.fenGIeD-emLyAYqz1WMqEh9N31TIJeTWOErR82KD1UA",
        "Content-Type": "application/x-www-form-urlencoded"
    ]
    
    func get(url: String,
             params: [String : Any]?,
             completion: @escaping (Any?) -> Swift.Void,
             failure: @escaping (String?) -> Swift.Void) {
            Alamofire.request(url, method: .get, parameters: params, headers: headers).responseString { (response) in
                if response.result.value != nil {
                    completion(response.result.value)
                } else {
                    failure(response.result.value)
                }
            }
//        Alamofire.request(url, method: .get, parameters: params, headers: headers).responseString { (data) in
//            NSLog("\(data.result.value)")
//        }
    }
    
    
    
    func post(url: String,
              params: [String : Any]?,
              completion: @escaping (Any?) -> Swift.Void,
              failure: @escaping (String?) -> Swift.Void) {
            Alamofire.request(url, method: .post, parameters: params).responseJSON(completionHandler: { (response) in
                if response.result.value != nil {
                    completion(response.result.value)
                } else {
                    failure(response.result.value as? String)
                }
            })
        
    }
}
