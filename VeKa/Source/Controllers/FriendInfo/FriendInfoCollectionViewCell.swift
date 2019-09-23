//
//  FriendInfoCollectionViewCell.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendInfoImageView: UIImageView!
    
    @IBOutlet weak var nameFriendInfoLabel: UILabel!
    
    @IBOutlet weak var likesView: LikesView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendInfoImageView.image = nil
        nameFriendInfoLabel.text = nil
    }
    
}
