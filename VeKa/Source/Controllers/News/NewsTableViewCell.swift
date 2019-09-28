//
//  NewsTableViewCell.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 28.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsText: UILabel!
    
    @IBOutlet weak var newsLikeView: LikesView!
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        newsText.text = nil
        newsLikeView.likeIcon.image = nil
        newsLikeView.likesCount.text = nil
    }
    
}

