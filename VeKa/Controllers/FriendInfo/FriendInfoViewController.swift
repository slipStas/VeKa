//
//  FriendInfoViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendInfoViewController: UIViewController {
    
    var friendInfoList : [(UIImage, String)] = []
    
    @IBOutlet weak var friendInfoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendInfoCollectionView.dataSource = self
        
    }
    
}

extension FriendInfoViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = friendInfoCollectionView.dequeueReusableCell(withReuseIdentifier: "friendInfoIdentifire", for: indexPath) as! FriendInfoCollectionViewCell
        
        cell.friendInfoImageView.image = friendInfoList[indexPath.row].0
        cell.nameFriendInfoLabel.text = friendInfoList[indexPath.row].1
        
        return cell
    }
    
    
}





