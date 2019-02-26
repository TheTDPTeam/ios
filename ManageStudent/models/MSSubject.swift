//
//  MSSubject.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSSubject : Mappable {
    var name                       : String?
    var subjectName                : String?
    var theoryScore                : Int?
    var theoryScoreStatus          : String?
    var practicalScore             : Int?
    var practicalScoreStatus       : String?
    var description                : String?
    var numberOfLessons            : Int?
    var hasTheoryExamination       : Bool?
    var hasPracticalExamination    : Bool?
    var attendingRate              : String?
    var success                    : Bool?
    var project                    : Bool?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name                <- map["name"]
        subjectName          <- map["subjectName"]
        theoryScore          <- map["theoryScore"]
        theoryScoreStatus     <- map["theoryScoreStatus"]
        practicalScore        <- map["practicalScore"]
        practicalScoreStatus   <- map["practicalScoreStatus"]
        description           <- map["description"]
        numberOfLessons        <- map["numberOfLessons"]
        hasTheoryExamination   <- map["hasTheoryExamination"]
        hasPracticalExamination <- map["hasPracticalExamination"]
        attendingRate         <- map["attendingRate"]
        success               <- map["success"]
        project               <- map["project"]
        
    }
}
