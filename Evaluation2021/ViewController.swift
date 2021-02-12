//
//  ViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 11/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import UIKit
import Foundation

class ViewController: NavigationBaseViewController   {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: Any) {
//        if let controller = UIViewController.controller(forURLType: URLType.homePage.rawValue, title: nil, data: nil, otherInfo: nil) as? HomeViewController {
//                              self.navigationController?.pushViewController(controller, animated: true)
//                          }
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        //self.present(vc, animated: true)
    }
      
      override func handleLeftButtonTapFrom(view: NavigationTitleView?) {
          self.navigationController?.popViewController(animated: true)
      }
      
      override func leftButton() -> (title: String?, image: UIImage?)? {
          return navigationBarStyleBackButton()
      }
      
      override func navigationTitle() -> String {
          return NSLocalizedString("", comment: "")
      }
      
    
}

