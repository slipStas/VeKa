//
//  AllGroupsViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    let allGroupsArray = [
        Group(name: "AppStores", icon: UIImage(named: "icon_1")!),
        Group(name: "Safaries", icon: UIImage(named: "icon_2")!),
        Group(name: "Mails", icon: UIImage(named: "icon_3")!),
        Group(name: "ApleTVs", icon: UIImage(named: "icon_4")!),
        Group(name: "Homes", icon: UIImage(named: "icon_5")!),
        Group(name: "Siries", icon: UIImage(named: "icon_6")!),
        Group(name: "Locators", icon: UIImage(named: "icon_7")!),
        Group(name: "Photo Boothes", icon: UIImage(named: "icon_8")!),
        Group(name: "Shares", icon: UIImage(named: "icon_9")!),
        Group(name: "Maps", icon: UIImage(named: "icon_10")!),
    ]

    @IBOutlet weak var allGroupsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allGroupsTableView.rowHeight = 66
        allGroupsTableView.dataSource = self
    }
}

extension AllGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allGroupsTableView.dequeueReusableCell(withIdentifier: "allGroupsIdentifier", for: indexPath) as! AllGroupsTableViewCell
        
        cell.allGroupImageView.image = allGroupsArray[indexPath.row].icon
        cell.allGroupLabel.text = allGroupsArray[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
