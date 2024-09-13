//
//  AppColors.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 03/09/24.
//

import Foundation
import UIKit


//MARK: - COLOR


let COLOR_CLEAR = UIColor.clear

//V3.1 Colors
struct APPCOLORS
{
    static let App_Color = UIColor.hexCode("#0F7CC2")
   
}

extension UIColor {
    
    public class func hexCode(_ hexString: String) -> UIColor {
        
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") || hexString.count == 6 {
//            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.replacingOccurrences(of: "#", with: "")// String(hexString[start]) // Swift 4 //hexString.substring(from: start)
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt32 = 0
                
                if scanner.scanHexInt32(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff) >> 0) / 255
                    a = CGFloat(1)
                    
                    return UIColor(red: r, green: g, blue: b, alpha: a)
                }
            }
        }
        
        return UIColor.black
    }
}
