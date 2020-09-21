//
//  OnlineFriendsListTableViewCell.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 07.12.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class OnlineFriendsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    @IBOutlet weak var friendIcon: UIImageView!
    
    
       override func prepareForReuse() {
           super.prepareForReuse()
           
        friendNameLabel.text = nil
        friendIcon.image = nil
       }
  
}
