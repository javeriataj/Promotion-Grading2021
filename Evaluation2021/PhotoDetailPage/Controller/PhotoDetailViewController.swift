//
//  PhotoDetailViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailViewController : NavigationBaseViewController {
    
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePic: UIButton!
    @IBOutlet weak var zoomOutButton: UIButton!
    @IBOutlet weak var zoomInButton: UIButton!
    var photoName = ""
    @IBOutlet weak var detailImmage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = photoName
    }
    
    
    override class func controller() -> PhotoDetailViewController {
        return UIStoryboard.PhotoDetail.instantiateViewController(withIdentifier: "\(PhotoDetailViewController.self)") as! PhotoDetailViewController
    }
    
    override func handleLeftButtonTapFrom(view: NavigationTitleView?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func leftButton() -> (title: String?, image: UIImage?)? {
        return navigationBarStyleBackButton()
    }
    
    override func rightButton() -> (title: String?, image: UIImage?)? {
        return (title: NSLocalizedString("", comment: ""), image: UIImage(named: "menu"))
    }
    
    override func navigationTitle() -> String {
        return NSLocalizedString(photoName, comment: "")
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        favouriteButton.isSelected = !favouriteButton.isSelected
    }

    
}
