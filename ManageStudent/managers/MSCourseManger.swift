//
//  MSCourseManger.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class MSCourseManager {
    static let shareInstance = MSCourseManager()
    var listCourse = [MSCourse]()
    
    func fetchCourse(completion: @escaping ([MSCourse]) -> Swift.Void) {
        MSBaseRequestManager.shareInstance.get(url: SERVER_REQUEST_URL + REQUEST_COURSE_INFO, params: nil, completion: { (JSON) in
            let data = JSON as! NSArray
            for item in data {
                let course = Mapper<MSCourse>().map(JSON: item as! [String : Any])
                self.listCourse.append(course!)
            }
            completion(self.listCourse)
        }) { (error) in
            NSLog("STAFF ERROR :\(error ?? "")")
        }
    }
    
    
}
