//
//  FriendInfoViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendInfoViewController: UIViewController {
    
    var friendInfoList : [User] = []
    
    @IBOutlet weak var friendInfoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendInfoCollectionView.dataSource = self
        friendInfoCollectionView.delegate = self

    }
}

extension FriendInfoViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = friendInfoCollectionView.dequeueReusableCell(withReuseIdentifier: "friendInfoIdentifire", for: indexPath) as! FriendInfoCollectionViewCell
        
        cell.friendInfoImageView.image = friendInfoList[indexPath.row].avatar
        cell.nameFriendInfoLabel.text = friendInfoList[indexPath.row].name
        cell.likesView.label.text = String(friendInfoList[0].likesCount)
        cell.likesView.onTap = {
            if cell.likesView.likesStatus == .noLike {
                self.friendInfoList[indexPath.row].likesCount += 1
                cell.likesView.likesStatus = .like
                self.friendInfoCollectionView.reloadData()
            } else {
                self.friendInfoList[indexPath.row].likesCount -= 1
                cell.likesView.likesStatus = .noLike
                self.friendInfoCollectionView.reloadData()
            }
        }
        
        print(cell.likesView.likesStatus)
        return cell
    }
}





