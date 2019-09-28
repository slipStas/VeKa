//
//  News.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 28.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class News {
    
    var images: [UIImage] = []
    var newsText = ""
    var likes : Likes = Likes(likesCounts: 0, likeStatus: .noLike)
    
    init(images: [UIImage], newsText: String) {
        self.images = images
        self.newsText = newsText
    }
    
    private func addImage(image: [UIImage]) {
        images.append(contentsOf: image)
    }
    
}
