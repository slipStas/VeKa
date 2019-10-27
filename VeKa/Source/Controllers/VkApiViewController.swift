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
            Session.shared.userId = (Int(userId) ?? nil)!
        }
        
        
        print("token - \(Session.shared.token)")
        print("User ID - \(Session.shared.userId)")
        
        decisionHandler(.cancel)
    }
    
}
