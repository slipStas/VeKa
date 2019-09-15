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

        myGroupsTableView.dataSource = self
        myGroupsTableView.delegate = self
    }
    
}

extension MyGroupsViewController: UITableViewDelegate {
    
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
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
}
