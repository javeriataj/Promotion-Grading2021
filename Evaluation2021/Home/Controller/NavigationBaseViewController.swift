//
//  NavigationBaseViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 12/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import Foundation
import UIKit

/// All the controllers with NavigationTitleView and navigation bar should be derived from this class
class NavigationBaseViewController: BaseViewController {

    // A view needs to be added at the top in place of navigation bar and connected to this outet.
    
    @IBOutlet weak var navigationContainerView: UIView!
    
    var navigationTitleView: NavigationTitleView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationTitleView()
    }
    
    private func configureNavigationTitleView() {
        navigationTitleView?.removeFromSuperview()
        navigationTitleView = NavigationTitleView.instatiateWithOwner(self)
        
        if let navigationTitleView = navigationTitleView,
            let navigationContainerView = navigationContainerView {
            navigationContainerView.addSubview(navigationTitleView)
            NSLayoutConstraint.setEqualFrameConstraints(parentView: navigationContainerView, subView: navigationTitleView)
            navigationTitleView.delegate = self
            
            navigationTitleView.configureLeftButton(buttonDetails: leftButton())
            navigationTitleView.configureLeftButtonTextColor(color:leftButtonTextColor())
            navigationTitleView.configureRightButton(buttonDetails: rightButton())
            navigationTitleView.configureTitle(navigationTitle())
            navigationTitleView.configureTitleColor(titleTextColor())
            navigationTitleView.backgroundColor = titleViewbackgroundColor()
        }
    }
    
    // Methods to be overrideen in subclasses
    func handleLeftButtonTapFrom(view: NavigationTitleView?) {
        
    }
    
    func handleRightButtonTapFrom(view: NavigationTitleView?) {
        
    }
    
    func leftButton() -> (title: String?, image: UIImage?)? {
        return nil
    }
    
    func rightButton() -> (title: String?, image: UIImage?)? {
        return nil
    }
    
    func navigationTitle() -> String {
        return ""
    }
    
    func titleViewbackgroundColor() -> UIColor {
        return UIColor.whiteSmoke
    }
    
    func leftButtonTextColor() -> UIColor {
        return UIColor.richElectricBlue
    }
    
    func titleTextColor() -> UIColor {
        return #colorLiteral(red: 0.01176470588, green: 0.01176470588, blue: 0.01176470588, alpha: 1)//UIColor.midnightBlue
    }
    
    func navigationBarStyleBackButton() -> (title: String?, image: UIImage?)? {
        return
            (title: NSLocalizedString("", comment: ""), image: #imageLiteral(resourceName: "icn_back").imageFlippedForRightToLeftLayoutDirection())
    }
}

// MARK: - NavigationTitleViewDelegate methods

extension NavigationBaseViewController: NavigationTitleViewDelegate {
    func leftButtonTapped(view: NavigationTitleView) {
        handleLeftButtonTapFrom(view: view)
    }
    
    func rightButtonTapped(view: NavigationTitleView) {
        handleRightButtonTapFrom(view: view)
    }
}
