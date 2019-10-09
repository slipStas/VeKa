//
//  FriendsPhotosViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 05.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    var photoArray: [UIImage] = []
    
    @IBOutlet weak var friendsPhotosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsPhotosCollectionView.dataSource = self
        
        let backgroundColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.5)
        let width = (view.frame.width - 20) / 3
        let layout = friendsPhotosCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        friendsPhotosCollectionView.backgroundColor = backgroundColor
    }
    
}

extension FriendsPhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendsPhotosCollectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotosIdentifier", for: indexPath) as! FriendsPhotosCollectionViewCell
        
        cell.friendsPhotos.image = photoArray[indexPath.row]
        
        return cell
    }
}

