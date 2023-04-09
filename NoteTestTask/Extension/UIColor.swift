//
//  UIColor.swift
//  NoteTestTask
//
//  Created by Amir Zhunussov on 07.04.2023.
//

import UIKit

extension UIColor {
    
    func color(_ hex: String) -> UIColor {
        
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.black
        }
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: 1.0)
    }
    
    static func myVioletColor() -> UIColor {
        return UIColor().color("6A3EA1")
    }
    
    static func mySearchColor() -> UIColor {
        return UIColor().color("EFEEF0")
    }
    
    static func myHashtagColor() -> UIColor {
        return UIColor().color("EFE9F7")
    }
    static func myBlueColor() -> UIColor {
        return UIColor().color("009FBD")
    }
    
    static func myOrangeColor() -> UIColor {
        return UIColor().color("FF6000")
    }
    
    static func myGreenColor() -> UIColor {
        return UIColor().color("C7E9B0")
    }
    
    static func myYellowColor() -> UIColor {
        return UIColor().color("FFD93D")
    }
    
    static func myCyanColor() -> UIColor {
        return UIColor().color("27E1C1")
    }
    
    static func myRedColor() -> UIColor {
        return UIColor().color("FC2947")
    }
    
    static func mySomeColor() -> UIColor {
        return UIColor().color("FFBF9B")
    }
    
 
}
