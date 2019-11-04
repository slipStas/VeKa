//
//  VkApiViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 26.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit
import Alamofire
import WebKit

class VkApiViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7184887"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
                
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        webView.navigationDelegate = self
    }
}

extension VkApiViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html" else {
                decisionHandler(.allow)
                return
        }
        
        let params = url.fragment?
            .components(separatedBy: "&")
            .map( {$0.components(separatedBy: "=")} )
            .reduce([String: String](), { (result, params) in
                var dict = result
                let key = params[0]
                let value = params[1]
                dict[key] = value
                
                return dict
            })
        print(params!)
        
        if let token = params?["access_token"] {
            Session.shared.token = token
        }
        if let userId = params?["user_id"] {
            Session.shared.userId = userId
        }
        
        
        print("token - \(Session.shared.token)")
        print("User ID - \(Session.shared.userId)")
        
        decisionHandler(.cancel)
        
        let vkFriends = VkFriendsRequests()
        print(vkFriends.showFriends())
        
        if Session.shared.token.count != 0 {
            if let resultController = storyboard!.instantiateViewController(withIdentifier: "authorizationOk") as? TabBarController {
                present(resultController, animated: true, completion: nil)
            }
        }
    }
    
}

class VkFriendsRequests {
    
    let userID = Session.shared.userId
    let token = Session.shared.token
    
    /**
     Send a request to the server to get the friends list
     */
    func showFriends() {
        
        let accessParameters: Parameters = ["access_token" : token, "user_id" : userID]

        var urlFriends = URLComponents()
        urlFriends.scheme = "https"
        urlFriends.host = "api.vk.com"
        urlFriends.path = "/method/friends.get"
        urlFriends.queryItems = [
            URLQueryItem(name: "fields", value: "nickname"),
            URLQueryItem(name: "fields", value: "city"),
            URLQueryItem(name: "fields", value: "country"),
            URLQueryItem(name: "fields", value: "photo_200_orig"),
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "v", value: "5.102")
        ]
        
        Alamofire.request(urlFriends.url!, method: .get, parameters: accessParameters).responseJSON { (response) in
        }
    }
}

class VkGroupsRequsts {
    let userID = Session.shared.userId
    let token = Session.shared.token
    
    /**
    Send a request to the server to get the groups
    */
    func getGroups() {
        
        let accessParameters: Parameters = ["access_token" : token, "user_id" : userID]

        var urlGroups = URLComponents()
        urlGroups.scheme = "https"
        urlGroups.host = "api.vk.com"
        urlGroups.path = "/method/groups.get"
        urlGroups.queryItems = [
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "v", value: "5.102")
        ]
        
        Alamofire.request(urlGroups.url!, method: .get, parameters: accessParameters).responseJSON { (response) in
        }
    }
    
    func groupSearch(search: String) {
        
        let accessParameters: Parameters = ["access_token" : token]
        var urlGroups = URLComponents()
        urlGroups.scheme = "https"
        urlGroups.host = "api.vk.com"
        urlGroups.path = "/method/groups.search"
        urlGroups.queryItems = [
            URLQueryItem(name: "q", value: search),
            URLQueryItem(name: "sort", value: "0"),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "v", value: "5.102")
        ]
        
        Alamofire.request(urlGroups.url!, method: .get, parameters: accessParameters).responseJSON { (response) in
        }
    }
}

class VkPhotosRequests {
    let userID = Session.shared.userId
    let token = Session.shared.token
    
    /**
    Send a request to the server to get the photos
    */
    func getPhotos() {
        
        let accessParameters: Parameters = ["access_token" : token, "user_id" : userID]

        var urlPhotos = URLComponents()
        urlPhotos.scheme = "https"
        urlPhotos.host = "api.vk.com"
        urlPhotos.path = "/method/photos.getAll"
        urlPhotos.queryItems = [
            URLQueryItem(name: "order", value: "hints"),
            URLQueryItem(name: "v", value: "5.102")
        ]
        
        Alamofire.request(urlPhotos.url!, method: .get, parameters: accessParameters).responseJSON { (response) in
        }
    }
}
