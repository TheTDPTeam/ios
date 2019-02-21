//
//  MSConstaint.swift
//  ManageStudent
//
//  Created by tri minh on 1/5/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import UIKit

var SERVER_REQUEST_URL = "https://student-management-api.herokuapp.com"

let BundleID = Bundle.main.bundleIdentifier!



//MARK: Enum




extension String {
    var toJSON : [String: Any]? {
        let data = self.data(using: .utf8)!
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String: Any] {
                return json
            } else {
                return nil
            }
        } catch _ as NSError {
            return nil
        }
    }
}
