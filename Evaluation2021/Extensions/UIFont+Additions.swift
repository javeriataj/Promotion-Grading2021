//
//  UIFont+Additions.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.


import UIKit

extension UIFont {
    
    static func RobotoRegular(size : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Regular", size: size)
    }
    
    static func RobotoBold(size : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: size)
    }
    
    static func RobotoBlack(size : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Black", size: size)
    }
    
    static func RobotoLight(size : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Light", size: size)
    }
    
    static func RobotoMedium(size : CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Medium", size: size)
    }
}
