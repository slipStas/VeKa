//
//  AllGroupsViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    let myGroupsArray: [(UIImage, String)] = [
        (UIImage(named: "icon_1")!, "AppStores"),
        (UIImage(named: "icon_2")!, "Safaries"),
        (UIImage(named: "icon_3")!, "Mails"),
        (UIImage(named: "icon_4")!, "ApleTVs"),
        (UIImage(named: "icon_5")!, "Homes"),
        (UIImage(named: "icon_6")!, "Siries"),
        (UIImage(named: "icon_7")!, "Locators"),
        (UIImage(named: "icon_8")!, "Photo Boothes"),
        (UIImage(named: "icon_9")!, "Shares"),
        (UIImage(named: "icon_10")!, "Maps"),
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
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allGroupsTableView.dequeueReusableCell(withIdentifier: "allGroupsIdentifier", for: indexPath) as! AllGroupsTableViewCell
        
        cell.allGroupImageView.image = myGroupsArray[indexPath.row].0
        cell.allGroupLabel.text = myGroupsArray[indexPath.row].1
        
        return cell
    }
    
    
}
