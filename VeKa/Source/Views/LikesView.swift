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
            case .noLike:
                likeIcon.image = UIImage(named: "heart")
            }
        }
    }
    let likeIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))

    let label = UILabel(frame: CGRect(x: 44, y: 0, width: 100, height: 44))
    
    
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(label)
        addSubview(likeIcon)
        
        likeIcon.image = UIImage(named: "heart")
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnLike(guestRecogniser:)))
        addGestureRecognizer(gr)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    @objc func tapOnLike(guestRecogniser: UITapGestureRecognizer) {
        onTap?()
    }

}
