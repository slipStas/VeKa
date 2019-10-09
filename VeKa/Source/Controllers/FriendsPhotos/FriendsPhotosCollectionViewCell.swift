//
//  FriendsPhotosCollectionViewCell.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 05.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendsPhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendsPhotos: UIImageView!
    
    override func prepareForReuse() {
        self.friendsPhotos.image = nil
    }
    
}
