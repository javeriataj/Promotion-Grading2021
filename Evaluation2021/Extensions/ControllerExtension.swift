//
//  ControllerExtension.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//


import UIKit

enum URLType: String {
    case homePage

    
   
    
    func classType() -> UIViewController.Type? {
        var classIdentifier: UIViewController.Type?
        
        switch self {
        case .homePage:
            classIdentifier = HomeViewController.self
 
        }
        
        return classIdentifier
    }
    
    func controller(withTitle title: String?, data: Any?, otherInfo: [String:Any]?) -> UIViewController {
        if classType() is BaseViewController.Type? {
            return (classType() as? BaseViewController.Type)?.controller(withTitle: title, urlType: self, data: data, otherInfo:otherInfo) ??
                BaseViewController.controller()
        } else {
            return BaseViewController.controller()
        }
    }
}

extension UIViewController {
    
    class func controller(forURLType urlType:String?, title:String?, data:Any?, otherInfo:[String:Any]?) -> UIViewController? {
        
        if let urlType = urlType, let value = URLType(rawValue: urlType) {
            return value.controller(withTitle: title, data: data, otherInfo: otherInfo)
        }
        return nil
    }
    
}

