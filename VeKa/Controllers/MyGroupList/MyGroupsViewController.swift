//
//  MyGroupsViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 14.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class MyGroupsViewController: UIViewController {
    
    var myGroupsArray: [Group] = []

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
        
        cell.myGroupsImageView.image = myGroupsArray[indexPath.row].icon
        cell.myGroupsNameLabel.text = myGroupsArray[indexPath.row].name
        
        return cell
    }
    
    @IBAction func unwindToMyGroups(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "addGroupSegueIdentifier" {
            guard let allGroupController = unwindSegue.source as? AllGroupsViewController else {return}
            guard let indexPath = allGroupController.allGroupsTableView.indexPathForSelectedRow else {return}
            
            let group = allGroupController.allGroupsArray[indexPath.row]
            
            if !myGroupsArray.contains(where: {$0.name == group.name}) {
                 myGroupsArray.append(allGroupController.allGroupsArray[indexPath.row])
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
