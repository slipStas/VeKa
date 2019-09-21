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
        User(name: "Valera", avatar: (UIImage(named: "image_1")!), likesCount: 490, likesStatus: .noLike),
        User(name: "Igor", avatar: (UIImage(named: "image_2")!), likesCount: 10, likesStatus: .noLike),
        User(name: "Elena", avatar: (UIImage(named: "image_3")!), likesCount: 7653, likesStatus: .noLike),
        User(name: "Oleg", avatar: (UIImage(named: "image_4")!), likesCount: 9719, likesStatus: .noLike),
        User(name: "Mikhail", avatar: (UIImage(named: "image_5")!), likesCount: 54, likesStatus: .noLike),
        User(name: "Valera1", avatar: (UIImage(named: "image_1")!), likesCount: 567, likesStatus: .noLike),
        User(name: "Igor1", avatar: (UIImage(named: "image_2")!), likesCount: 4568, likesStatus: .noLike),
        User(name: "Elena1", avatar: (UIImage(named: "image_3")!), likesCount: 1, likesStatus: .noLike),
        User(name: "Oleg1", avatar: (UIImage(named: "image_4")!), likesCount: 423, likesStatus: .noLike),
        User(name: "Mikhail1", avatar: (UIImage(named: "image_5")!), likesCount: 974, likesStatus: .noLike),
        User(name: "Valera2", avatar: (UIImage(named: "image_1")!), likesCount: 1113, likesStatus: .noLike),
        User(name: "Igor2", avatar: (UIImage(named: "image_2")!), likesCount: 96528, likesStatus: .noLike),
        User(name: "Elena2", avatar: (UIImage(named: "image_3")!), likesCount: 100000, likesStatus: .noLike),
        User(name: "Oleg2", avatar: (UIImage(named: "image_4")!), likesCount: 2, likesStatus: .noLike),
        User(name: "Mikhail2", avatar: (UIImage(named: "image_5")!), likesCount: 89, likesStatus: .noLike)
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
