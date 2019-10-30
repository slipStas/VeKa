//
//  User.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 17.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class User {
    
    class Name {
        
        var firstName = ""
        var lastName = ""
        
        var fullName: String {
            get {
               return lastName + " " + firstName
                
            }
        }
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
    }
    
    let id = ""
    var name = Name(firstName: "", lastName: "")
    var avatar = UIImage()
    var likes = Likes(likesCounts: 0, likeStatus: .noLike)
    var photos: [UIImage] = []
    
    init(name: Name, avatar: UIImage, likes: Likes) {
        self.name = name
        self.avatar = avatar
        self.likes = likes
    }
    
}



