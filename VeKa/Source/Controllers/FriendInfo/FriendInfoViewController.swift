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


        let width = view.frame.width
        let layout = friendInfoCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        if let likeView = Bundle.main.loadNibNamed("LikeView", owner: self, options: nil)?.first as? LikeView {
            likeView.likeButton.tintColor = .lightGray
            likeView.likeLabel.text = String(friendInfoList[0].likesCount)
            view.addSubview(likeView)
            likeView.frame.origin.x = 10
            likeView.frame.origin.y = view.bounds.width
            
        }
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
        //cell.friendInfoLikeView.likeLabel.text = String(friendInfoList[0].likesCount)
        
        return cell
    }
}





