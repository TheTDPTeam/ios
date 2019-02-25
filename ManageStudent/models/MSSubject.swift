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
    var description                : String?
    var numberOfLessons            : Int?
    var hasTheoryExamination       : Bool?
    var hasPracticalExamination    : Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name                 <- map["name"]
        description           <- map["description"]
        numberOfLessons        <- map["numberOfLessons"]
        hasTheoryExamination   <- map["hasTheoryExamination"]
        hasPracticalExamination <- map["hasPracticalExamination"]
    }
}
