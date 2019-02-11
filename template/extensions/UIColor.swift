//
//  UIColor.swift
//  ManageStudent
//
//  Created by tri minh on 1/18/19.
//  Copyright © 2019 tri minh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(from: hex.index(after: hex.startIndex))
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.characters.count) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
            break;
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
            break;
        default:
            // TODO:ERROR
            break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
    
    //gray
    static var appTitlePrimaryColor: UIColor {
        return UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0)
    }
    
    static var greenColor: UIColor {
        return UIColor(hex: "30C073", alpha: 1.0)
    }
    
    static var redColor: UIColor {
        return UIColor(hex: "FF4F22", alpha: 1.0)
    }
    
    // orange
    static var appPrimaryColor: UIColor {
        return UIColor.init(hex: "F39C12", alpha: 1.0)
    }
    //orange
    static func appPrimaryColor(alpha: CGFloat)-> UIColor {
        return UIColor.init(hex: "F39C12", alpha: alpha)
    }
    
    static func grayColor(alpha: CGFloat)-> UIColor {
        return UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: alpha)
    }
}
