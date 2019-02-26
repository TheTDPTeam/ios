//
//  MSAttendance.swift
//  ManageStudent
//
//  Created by tri minh on 2/25/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import ObjectMapper

class MSAttendance : Mappable {
    var checkingDate    : String?
    var status          : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        checkingDate     <- (map["checkingDate"],checkingDateTransform())
        status           <- map["status"]
    }
    
    func checkingDateTransform() -> TransformOf<String, Any> {
        return TransformOf<String, Any>(fromJSON: { (data: Any?) -> String? in
            if data != nil {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // This formate is input formated .

                let formateDate = dateFormatter.date(from: data as! String )!
                dateFormatter.dateFormat = "yyyy/MM/dd" // Output Formated
                return dateFormatter.string(from: formateDate)
                
            } else {
                return nil
            }
            
        }, toJSON: { (value: String?) -> Any? in
            return value
        })
    }
}
