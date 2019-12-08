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
        cell.friendIcon.image = UIImage(named: "image_2")
        
        self.onlineFriendsListTable.rowHeight = cell.friendIcon.frame.height + CGFloat(16)

        return cell
    }
    
    
}
