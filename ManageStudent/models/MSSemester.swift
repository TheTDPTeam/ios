//
//  MSSemester.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSSemester : Mappable {
    
    var semesterName: String?
    var subjects : [MSSubject]!
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        semesterName <- map["semesterName"]
        subjects <- map["subjects"]
    }
}
