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
        User(name: "John", avatar: (UIImage(named: "image_1")!), likesCount: 567, likesStatus: .noLike),
        User(name: "Stanislav", avatar: (UIImage(named: "image_2")!), likesCount: 4568, likesStatus: .noLike),
        User(name: "Olga", avatar: (UIImage(named: "image_3")!), likesCount: 1, likesStatus: .noLike),
        User(name: "Viktor", avatar: (UIImage(named: "image_4")!), likesCount: 423, likesStatus: .noLike),
        User(name: "Denis", avatar: (UIImage(named: "image_5")!), likesCount: 974, likesStatus: .noLike),
        User(name: "Alex", avatar: (UIImage(named: "image_1")!), likesCount: 1113, likesStatus: .noLike),
        User(name: "Alexander", avatar: (UIImage(named: "image_2")!), likesCount: 96528, likesStatus: .noLike),
        User(name: "Julia", avatar: (UIImage(named: "image_3")!), likesCount: 100000, likesStatus: .noLike),
        User(name: "Pavel", avatar: (UIImage(named: "image_4")!), likesCount: 2, likesStatus: .noLike),
        User(name: "Anton", avatar: (UIImage(named: "image_5")!), likesCount: 89, likesStatus: .noLike)
    ]
    
    var friendsFiltered: [User] = []
    
    var sections: [String] = []
    var friendsInSections: [String: [User]] = [:]
    
    private var selectedFriend: User?
    
    @IBOutlet weak var friendsListTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsListTableView.rowHeight = 66
        
        friendsListTableView.dataSource = self
        friendsListTableView.delegate = self
        
        friendsListTableView.register(UINib(nibName: "Header", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        
        self.friendsFiltered = self.friendsArray
        
        fillSections()
        fillSectionsWithFriends()
        
    }
    
    
}

extension FriendsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = friendsListTableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! Header
        header.backgroundView = UIView(frame: header.bounds)
        header.backgroundView?.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        header.backgroundView?.alpha = 0.1
        header.headerLabel.alpha = 0.6
        header.headerLabel.text = sections[section]
    
        return header
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //animateWidthTable(tableView: friendsListTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionName: String = self.sections[indexPath.section]
        if let friendsInSection: [User] = self.friendsInSections[sectionName] {
            print("""
            select friend "\(friendsInSection[indexPath.row].name)"
            """)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FriendsListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName: String = self.sections[section]
        if let friendsInSection: [User] = self.friendsInSections[sectionName] { return friendsInSection.count }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsListTableView.dequeueReusableCell(withIdentifier: "friendsListIdentifire", for: indexPath) as! FriendsListTableViewCell
        
        
        let sectionName: String = self.sections[indexPath.section]
        if let friendsInSection: [User] = self.friendsInSections[sectionName] {
            cell.friendNameLabel.text = friendsInSection[indexPath.row].name
            cell.friendsPhotoImageView.image = friendsInSection[indexPath.row].avatar
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier, identifier == "showFriendInfo" {
            if let indexPath = friendsListTableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination  as? FriendInfoViewController {
                    let sectionName: String = self.sections[indexPath.section]
                    if let friendsInSection: [User] = self.friendsInSections[sectionName] {
                        destinationVC.friendInfoList = [(friendsInSection[(indexPath as NSIndexPath).row])]

                    }
                }
            }
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    func filter(query: String) {
        friendsFiltered.removeAll()
        
        var isInFilter = true
        
        for friend in friendsArray {
            if query.count > 0 { isInFilter = (friend.name.lowercased().contains(query.lowercased())) }
            if isInFilter { friendsFiltered.append(friend) }
        }
        
        fillSections()
        fillSectionsWithFriends()
    }
    
    func fillSections() {
        sections = Array(Set(friendsFiltered.map { String(($0.name.first)!) })).sorted()
    }
    
    func fillSectionsWithFriends() {
        friendsInSections.removeAll()
        
        for friend in friendsFiltered {
            guard let firstLetter = friend.name.first else { continue }
            
            var friends: [User] = []
            
            if let friendsInSection = friendsInSections[String(firstLetter)] {
                friends.append(contentsOf: friendsInSection)
            }
            
            friends.append(friend)
            
            friendsInSections[String(firstLetter)] = friends
        }
    }
}

