//
//  FriendsListViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 13.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    let friendsArray = [
        User(name: "Valera", avatar: (UIImage(named: "image_1")!)),
        User(name: "Igor", avatar: (UIImage(named: "image_2")!)),
        User(name: "Elena", avatar: (UIImage(named: "image_3")!)),
        User(name: "Oleg", avatar: (UIImage(named: "image_4")!)),
        User(name: "Mikhail", avatar: (UIImage(named: "image_5")!)),
    ]

    @IBOutlet weak var friendsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsListTableView.rowHeight = 66
        
        friendsListTableView.dataSource = self
        friendsListTableView.delegate = self
    }
    
}

extension FriendsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("""
            select friend "\(friendsArray[indexPath.row].name)"
            """)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FriendsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsListTableView.dequeueReusableCell(withIdentifier: "friendsListIdentifire", for: indexPath) as! FriendsListTableViewCell
        
        cell.friendNameLabel.text = friendsArray[indexPath.row].name
        cell.friendsPhotoImageView.image = friendsArray[indexPath.row].avatar
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier, identifier == "showFriendInfo" {
            if let indexPath = friendsListTableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination  as? FriendInfoViewController {
                    
                    destinationVC.friendInfoList = [(friendsArray[(indexPath as NSIndexPath).row])]
                }
            }
        }
    }
}
