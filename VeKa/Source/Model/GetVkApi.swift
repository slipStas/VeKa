//
//  GetVkApi.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 07.12.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import Foundation
import Alamofire

class GetVkApi {
    
    var serverFriendList: ServerFriend?

    let token = Session.shared.token
    let userId = Session.shared.userId
    let url = "https://api.vk.com.method/"
    
    func getFriends(completionHandler: @escaping() -> ()) {
               
        var urlFriends = URLComponents()
        urlFriends.scheme = "https"
        urlFriends.host = "api.vk.com"
        urlFriends.path = "/method/friends.get"
        urlFriends.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "user_id", value: userId),

            URLQueryItem(name: "fields", value: "nickname"),
            URLQueryItem(name: "fields", value: "city"),
            URLQueryItem(name: "fields", value: "country"),
            URLQueryItem(name: "fields", value: "photo_200_orig"),
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "v", value: "5.102")
        ]
        
        
        Alamofire.request(urlFriends.url!).responseData { response in
            guard let data = response.value else { return }
            
            let friends = try! JSONDecoder().decode(ServerFriend.self, from: data)
            self.serverFriendList = friends
            completionHandler()
        }
    }
}
