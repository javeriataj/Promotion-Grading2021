//
//  MultimediaCollectionCell.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import Foundation
import UIKit

class MultimediaCollectionCell : UICollectionViewCell {
    
    @IBOutlet weak var VideoPhotoImage: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var profileName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    @IBAction func didTapFavourite(_ sender: Any) {
        favouriteButton.isSelected = !favouriteButton.isSelected
    }
}
