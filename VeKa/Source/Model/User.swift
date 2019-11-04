//
//  User.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 17.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit
import SwiftyJSON

class User: Decodable {
    
    var id = ""
    var name = ""
    var avatar = UIImage()
    var likes = Likes(likesCounts: 0, likeStatus: .noLike)
    var photos: [UIImage] = []
    
    init (json: [String: JSON]) {
        name = (json["first_name"]?.stringValue ?? "") + " " + (json["last_name"]?.stringValue ?? "")
    }
    
    init(name: String, avatar: UIImage, likes: Likes) {
        self.name = name
        self.avatar = avatar
        self.likes = likes
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "first_name"
    }
    
}




