//
//  BaseViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import Foundation
import UIKit
//This class forms the base of all view controllers in the app.
class BaseViewController: UIViewController {
    
    var urlType: URLType?
    var data: Any?
    var otherInfo: [String:Any]?
    
    class func controller(withTitle title: String?, urlType: URLType?, data: Any?,
                          otherInfo: [String:Any]?) -> BaseViewController {
        let viewController = self.controller()
        viewController.urlType = urlType
        viewController.data = data
        viewController.otherInfo = otherInfo
        viewController.title = title
        return viewController
    }
    
    // All the sub classes needs to override this method and return appropriate controller
    class func controller() -> BaseViewController {
        return BaseViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}





