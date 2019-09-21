//
//  User.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 17.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

struct User {
    
    enum LikesStatus {
        case like
        case noLike
    }
    
    let name : String
    let avatar : UIImage
    var likesCount : UInt
    var likesStatus : LikesStatus
    
}



