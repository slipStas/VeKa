//
//  User.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 17.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class User {
    
    enum LikesStatus {
        case like
        case noLike
    }
    
    let name : String
    let avatar : UIImage
    var likesCount : UInt
    var likesStatus : LikesStatus
    
    init(name: String, avatar: UIImage, likesCount: UInt, likesStatus: LikesStatus) {
        self.name = name
        self.avatar = avatar
        self.likesCount = likesCount
        self.likesStatus = likesStatus
    }
    
}



