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
    "Valera",
    "Igor",
    "Elena",
    "Oleg",
    "Mikhail"]

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
        
        cell.friendNameLabel.text = friendsArray[indexPath.row]
        
        return cell
    }
    
    
}
