//
//  MSCalendarManager.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MSCalendarManager {
    static let shareInstance = MSCalendarManager()
    var listCalendar = [MSCalendar]()
    
    
    func fetchCalendar(completion: @escaping ([MSCalendar]) -> Swift.Void) {
        MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_CALENDAR_INFO, params: nil, completion: { (JSON) in
            let data = JSON as! NSArray
            for item in data {
                let calendar = Mapper<MSCalendar>().map(JSON: item as! [String : Any])
                self.listCalendar.append(calendar!)
            }
            completion(self.listCalendar)
        }) { (error) in
            NSLog("STAFF ERROR :\(error ?? "")")
        }
    }
}
