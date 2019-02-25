//
//  MSContactManager.swift
//  ManageStudent
//
//  Created by tri minh on 2/24/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MSContactManager {
    static let shareInstance = MSContactManager()
    var listStaff = [MSStaff]()
    
    func fetchStaff(completion: @escaping ([MSStaff]) -> Swift.Void) {
        MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_STAFF_INFO, params: nil, completion: { (JSON) in
            let data = JSON as! NSArray
            for item in data {
                let staff = Mapper<MSStaff>().map(JSON: item as! [String : Any])
                self.listStaff.append(staff!)
            }
            completion(self.listStaff)
        }) { (error) in
            NSLog("STAFF ERROR :\(error ?? "")")
        }
    }
}
