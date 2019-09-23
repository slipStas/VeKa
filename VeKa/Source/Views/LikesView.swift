//
//  LikesView.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 23.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class LikesView: UIView {

    let label = UILabel(frame: CGRect.zero)
    //var image = UIImage(named: "heart_fill")
    var likesCount = 0 {
        didSet {
            label.text = String(likesCount)
        }
    }
    
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(label)
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnLike(guestRecogniser:)))
        addGestureRecognizer(gr)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = bounds
    }
    
    @objc func tapOnLike(guestRecogniser: UITapGestureRecognizer) {
        onTap?()
    }

}
