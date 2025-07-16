//
//  ViewExtensions.swift
//  DMSSAdmin
//
//  Created by Naveen Kourampalli on 03/09/24.
//

import Foundation
import UIKit


extension UIView{
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true,cornerRadius : CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
       }
    
}

func setStatusBarColor (color: UIColor? = APPCOLORS.App_Color) {
    
    UIApplication.shared.statusBarView?.backgroundColor = color
}


extension UIApplication {
    
    var statusBarView: UIView? {
        
        if #available(iOS 13, *)
        {
            let statusBar = UIView(frame: UIApplication.shared.windows.last?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            UIApplication.shared.windows.last?.addSubview(statusBar)
            return statusBar
        }else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
            return nil
        }
    }
}

extension UIButton {

    func alignImageRight() {
        if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        } else {
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        }
    }
}


//MARK: - ViewController Instance Creation
extension UIViewController
{
    #warning("must provide proper storyboard name to create viewcontroller instance")
    static func instace(sb : StoryBoard = .main) -> Self{
        
        let instance = UIStoryboard(name: sb.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as! Self
        return instance
    }
    
    enum StoryBoard : String
    {
        case main = "Main"
        
    }
}
