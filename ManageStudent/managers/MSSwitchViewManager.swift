//
//  MSSwitchViewManager.swift
//  ManageStudent
//
//  Created by tri minh on 2/21/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import UIKit

class MSSwitchViewManager {
    static let shareInstance = MSSwitchViewManager()
    
    func switchTabbarView() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchTabbar()
    }
    
}
