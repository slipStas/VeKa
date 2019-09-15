//
//  AllGroupsViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    let myGroupsArray: [(UIImage, String)] = []

    @IBOutlet weak var allGroupsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
