//
//  UIStoryboard+Additions.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    @nonobjc class var home: UIStoryboard {
        return UIStoryboard(name: "Home", bundle: nil)
    }
    @nonobjc class var PhotoDetail: UIStoryboard {
           return UIStoryboard(name: "PhotoDetail", bundle: nil)
       }
    
}
