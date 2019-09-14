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
    (UIImage(named: "image_1") , "Valera"),
    (UIImage(named: "image_2"), "Igor"),
    (UIImage(named: "image_3"), "Elena"),
    (UIImage(named: "image_4"), "Oleg"),
    (UIImage(named: "image_5"), "Mikhail")]

    @IBOutlet weak var friendsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsListTableView.dataSource = self
        friendsListTableView.delegate = self
    }
    
}

extension FriendsListViewController: UITableViewDelegate {
    
}

extension FriendsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    //friendsListIdentifire
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsListTableView.dequeueReusableCell(withIdentifier: "friendsListIdentifire", for: indexPath) as! FriendsListTableViewCell
        
        cell.friendNameLabel.text = friendsArray[indexPath.row].1
        cell.friendsPhotoImageView.image = friendsArray[indexPath.row].0
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier, identifier == "showFriendInfo" {
            if let indexPath = friendsListTableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination  as? FriendInfoViewController {
                    
                    destinationVC.friendInfoList = [(friendsArray[(indexPath as NSIndexPath).row].0!, friendsArray[(indexPath as NSIndexPath).row].1)]
                }
            }
        }
    }
    
}
