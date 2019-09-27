//
//  NewsTableViewCell.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 28.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsText: UITextField!
    
    @IBOutlet weak var newsLikeView: LikesView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        newsImage.image = nil
        newsText.text = nil
        newsLikeView = nil
    }

}
