//
//  HomeViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: NavigationBaseViewController   {
    var profileNames = ["Javeria","Taj","Bijly"]
    @IBOutlet weak var mutiMediaCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mutiMediaCollectionView.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        setupMenuBar()
        registerCell()
    }
    
    func registerCell(){
        let nib = UINib(nibName: "MultimediaCollectionCell", bundle: nil)
        mutiMediaCollectionView.register(nib, forCellWithReuseIdentifier: "MultimediaCollectionCell")
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|-350-[v0(50)]", views: menuBar)
    }
}

extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = mutiMediaCollectionView.dequeueReusableCell(withReuseIdentifier: "MultimediaCollectionCell", for: indexPath) as? MultimediaCollectionCell {
            cell.profileName.text = profileNames[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: self.mutiMediaCollectionView.frame.size.width , height: self.mutiMediaCollectionView.frame.size.height)
    }
    
    
}

