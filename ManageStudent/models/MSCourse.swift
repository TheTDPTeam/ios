//
//  MSCourse.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSCourse : Mappable {
    var courseCode: String?
    var semesters : [MSSemester]!
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        courseCode <- map["courseCode"]
        semesters <-  map["semesters"]
    }
}


