//
//  MSStaff.swift
//  ManageStudent
//
//  Created by tri minh on 2/24/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSStaff : Mappable {
    var email: String?
    var fullName : String?
    var phoneNumber : String?

    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        email <- map["email"]
        fullName <- map["fullName"]
        phoneNumber <- map["phoneNumber"]
    }
}
