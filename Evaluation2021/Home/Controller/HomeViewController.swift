//
//  HomeViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 12/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: NavigationBaseViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override class func controller() -> HomeViewController {
        return UIStoryboard.home.instantiateViewController(withIdentifier: "\(HomeViewController.self)") as! HomeViewController
       }
      
      override func handleLeftButtonTapFrom(view: NavigationTitleView?) {
          self.navigationController?.popViewController(animated: true)
      }
      
      override func leftButton() -> (title: String?, image: UIImage?)? {
          return navigationBarStyleBackButton()
      }
      
      override func navigationTitle() -> String {
          return NSLocalizedString("Seeker Services", comment: "")
      }
}
