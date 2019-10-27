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
        
        let vkFriends = VkFriends()
        vkFriends.sendRequest()
        
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
            Session.shared.userId = (Int(userId) ?? nil)!
        }
        
        
        print("token - \(Session.shared.token)")
        print("User ID - \(Session.shared.userId)")
        
        decisionHandler(.cancel)
    }
    
}

class VkFriends {
    func sendRequest() {
        
        let urlFriends = "https://api.vk.com/method/friends.get?user_id=87246210&order=hints&access_token=dfa0df6f08cb47ac804e84202bc232c27b8f166f29bcd947e35292e90d71bc75f519705e9bf1bbedf64f6&v=5.102"
        let urlPhotos = "https://api.vk.com/method/photos.getAll?user_id=87246210&order=hints&access_token=dfa0df6f08cb47ac804e84202bc232c27b8f166f29bcd947e35292e90d71bc75f519705e9bf1bbedf64f6&v=5.102"
        let urlGroups = "https://api.vk.com/method/groups.get?user_id=87246210&order=hints&access_token=dfa0df6f08cb47ac804e84202bc232c27b8f166f29bcd947e35292e90d71bc75f519705e9bf1bbedf64f6&v=5.102"
        
        Alamofire.request(urlFriends).responseJSON { (response) in
            print(response.value)
        }
        Alamofire.request(urlPhotos).responseJSON { (response) in
            print(response.value)
        }
        Alamofire.request(urlGroups).responseJSON { (response) in
            print(response.value)
        }
        
    }
}
