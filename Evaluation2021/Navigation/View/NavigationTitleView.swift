//
//  NavigationTitleView.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 12/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.

import UIKit

protocol NavigationTitleViewDelegate: class {
    func leftButtonTapped(view: NavigationTitleView)
    func rightButtonTapped(view: NavigationTitleView)
}

class BackButton: UIButton {
    
    override open var intrinsicContentSize: CGSize {
        
        let intrinsicContentSize = super.intrinsicContentSize
        
        let adjustedWidth = intrinsicContentSize.width + titleEdgeInsets.left + titleEdgeInsets.right
        let adjustedHeight = intrinsicContentSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom
        
        return CGSize(width: adjustedWidth, height: adjustedHeight)
    }
}

/// Custom navigation title view
class NavigationTitleView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: BackButton!
    @IBOutlet weak var rightButton: UIButton!
    
    weak var delegate: NavigationTitleViewDelegate?

    class func instatiateWithOwner(_ owner: Any?) -> NavigationTitleView? {
        return Bundle.main.loadNibNamed("\(NavigationTitleView.self)", owner: owner, options: nil)?.first as? NavigationTitleView
    }
    
    func configureLeftButton(buttonDetails: (title: String?, image: UIImage?)?) {
        leftButton.setImage(buttonDetails?.image?.imageFlippedForRightToLeftLayoutDirection(), for: .normal)
        leftButton.setTitle(buttonDetails?.title, for: .normal)
        
        if let buttonDetails = buttonDetails {
            if buttonDetails.title != nil && buttonDetails.image != nil {
                leftButton.titleEdgeInsets =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
//                    UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            }
        }
    }
    
    func configureRightButton(buttonDetails: (title: String?, image: UIImage?)?) {
        rightButton.setImage(buttonDetails?.image, for: .normal)
        rightButton.setTitle(buttonDetails?.title, for: .normal)
    }
    
    func configureTitle(_ title: String) {
        titleLabel.text = title
        titleLabel.font = UIFont.RobotoMedium(size: 16)
    }
    
    func configureTitleColor(_ color: UIColor) {
        titleLabel.textColor = color
    }
    
    func configureLeftButtonTextColor(color:UIColor) {
        leftButton.setTitleColor(color, for: .normal)
        leftButton.tintColor = color
    }
    
    @IBAction func leftButtonTapped(_ sender: Any) {
        delegate?.leftButtonTapped(view: self)
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        delegate?.rightButtonTapped(view: self)
    }
}
