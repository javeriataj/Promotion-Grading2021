//
//  HomeViewController.swift
//  Evaluation2021
//
//  Created by Javeria Taj on 13/02/21.
//  Copyright © 2021 Robosoft. All rights reserved.
//

import UIKit
import Foundation
import AlamofireImage

class HomeViewController: NavigationBaseViewController   {
    
    var photos = [PhotosModel]()
    var profileNames = ["Javeria","Taj","Bijly"]
    var baseURl = "https://api.opendota.com"
    //var photos = [""]
    @IBOutlet weak var mutiMediaCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mutiMediaCollectionView.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        setupMenuBar()
        registerCell()
        getPhotoDetails()
    }
    func getPhotoDetails(){
        let url = URL(string: "https://api.opendota.com/api/heroStats")
            URLSession.shared.dataTask(with: url!){ (data, response, error) in
                if error == nil{
                    do {
                        self.photos = try JSONDecoder().decode([PhotosModel].self, from: data!)
                    }catch {
                        print("Parsin error")
                    }
                    DispatchQueue.main.async {
                        self.mutiMediaCollectionView.reloadData()
                    }
                }
            }.resume()
    
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

extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let linkToImage = baseURl + photos[indexPath.row].img
        if let cell = mutiMediaCollectionView.dequeueReusableCell(withReuseIdentifier: "MultimediaCollectionCell", for: indexPath) as? MultimediaCollectionCell {
            cell.profileName.text = photos[indexPath.row].localized_name.capitalized
            cell.VideoPhotoImage.contentMode = .scaleAspectFill
            cell.VideoPhotoImage.downloaded(from: linkToImage)
            cell.layoutIfNeeded()
            return cell
        
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let linkToImage = baseURl + photos[indexPath.row].img
         if let photoDetailScreen = UIViewController.controller(forURLType: URLType.photoDetailPage.rawValue, title: nil, data: nil, otherInfo: nil)as? PhotoDetailViewController{
            photoDetailScreen.photoName = photos[indexPath.row].localized_name
                   navigationController?.pushViewController(photoDetailScreen, animated: true)
               }
    }
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
  
        return CGSize(width: view.frame.width, height: view.frame.height/3)
    }
    
    
}

