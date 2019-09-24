//
//  LikesView.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 23.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class LikesView: UIView {
    
    enum LikesStatus {
        case like
        case noLike
    }
    
    var likesStatus: LikesStatus = .noLike {
        didSet {
            switch likesStatus {
            case .like:
                likeIcon.image = UIImage(named: "heart_fill")
                label.textColor = UIColor.red
            case .noLike:
                likeIcon.image = UIImage(named: "heart")
                label.textColor = UIColor.darkText
            }
        }
    }
    let likeIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

    let label = UILabel(frame: CGRect(x: 30, y: 0, width: (30 * 3), height: 30))
    
    
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(label)
        addSubview(likeIcon)
        
        likeIcon.image = UIImage(named: "heart")
        label.textColor = UIColor.darkText
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnLike(guestRecogniser:)))
        addGestureRecognizer(gr)
    }
    
    @objc func tapOnLike(guestRecogniser: UITapGestureRecognizer) {
        onTap?()
    }

}
