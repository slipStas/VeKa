//
//  OnlineFriendsListViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 07.12.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit
import Alamofire

class OnlineFriendsListViewController: UIViewController {

    @IBOutlet weak var onlineFriendsListTable: UITableView!
    
    let vkApi = GetVkApi()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onlineFriendsListTable.dataSource = self
        onlineFriendsListTable.delegate = self
        
        vkApi.getFriends {
            self.onlineFriendsListTable.reloadData()
        }

    }
    
}

extension OnlineFriendsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension OnlineFriendsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vkApi.serverFriendList?.response.items.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = onlineFriendsListTable.dequeueReusableCell(withIdentifier: "onlineFriendsList", for: indexPath) as! OnlineFriendsListTableViewCell
        
        cell.friendNameLabel.text = (vkApi.serverFriendList?.response.items[indexPath.row].firstName ?? "no name") + " " + (vkApi.serverFriendList?.response.items[indexPath.row].lastName ?? "no last name")
        
        if let url = NSURL(string: (vkApi.serverFriendList?.response.items[indexPath.row].photo200_Orig) ?? "https://vk.com/images/camera_200.png?ava=1") {
            let data = NSData(contentsOf: url as URL)
            cell.friendIcon.image = UIImage(data: data! as Data)
        }
        
        self.onlineFriendsListTable.rowHeight = cell.friendIcon.frame.height + CGFloat(16)

        return cell
    }
    
    
}
