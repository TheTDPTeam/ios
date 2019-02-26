//
//  MSUser.swift
//  ManageStudent
//
//  Created by tri minh on 2/26/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSUser : Mappable {
    var email          : String?
    var phone          : String?
    var firstName      : String?
    var lastName       : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        email            <- map["email"]
        phone            <- map["phone"]
        firstName        <- map["firstName"]
        lastName         <- map["lastName"]
    }
}
