//
//  MyGroupsViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class MyGroupsViewController: UIViewController {
    
    var myGroupsArray: [(UIImage, String)] = []

    @IBOutlet weak var myGroupsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGroupsTableView.rowHeight = 66
        
        myGroupsTableView.dataSource = self
    }
    
}

extension MyGroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myGroupsTableView.dequeueReusableCell(withIdentifier: "myGroupsIdentifire", for: indexPath) as! MyGroupsTableViewCell
        
        cell.myGroupsImageView.image = myGroupsArray[indexPath.row].0
        cell.myGroupsNameLabel.text = myGroupsArray[indexPath.row].1
        
        return cell
    }
    
    @IBAction func unwindToMyGroups(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "addGroupSegueIdentifier" {
            guard let allGroupController = unwindSegue.source as? AllGroupsViewController else {return}
            guard let indexPath = allGroupController.allGroupsTableView.indexPathForSelectedRow else {return}
            
            let group = allGroupController.allGroupsArray[indexPath.row]
            
            if !myGroupsArray.contains(where: {$0.1 == group.1}) {
                 myGroupsArray.append(allGroupController.allGroupsArray[indexPath.row])
//                 myGroupsTableView.insertRows(at: [IndexPath(row: myGroupsArray.count - 1, section: 0)], with: .fade)
                 myGroupsTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            myGroupsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
