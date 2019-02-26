//
//  MSCalendar.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSCalendar : Mappable {
    var classCode: String?
    var subjectName: String?
    var teacherName: String?
    var semesterName: String?
    var calendar: String?
    
    var attendances : [MSAttendance]!
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        classCode <- map["classCode"]
        subjectName <- map["subjectName"]
        teacherName <- map["teacherName"]
        semesterName <- map["semesterName"]
        calendar <- map["calendar"]
        attendances <-  map["attendances"]
    }
}
