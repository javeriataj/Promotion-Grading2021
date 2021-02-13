//
//  NSLayoutConstraint+Additions.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.

import Foundation
import UIKit

extension NSLayoutConstraint {
    /// Set constraints such that subview frame is same as parentView frame
    static func setEqualFrameConstraints(parentView: UIView, subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutConstraint.Attribute] = [.leading, .trailing, .top, .bottom]
        attributes.forEach {
            parentView.addConstraint(NSLayoutConstraint(item: subView, attribute: $0, relatedBy: .equal, toItem: parentView, attribute: $0, multiplier: 1, constant: 0))
        }
    }
}
