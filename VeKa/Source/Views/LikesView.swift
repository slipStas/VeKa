//
//  LikesView.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 23.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class LikesView: UIView {
    
    var likesStatus: Likes.LikesStatus = .noLike {
        didSet {
            switch likesStatus {
            case .like:
                UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.35, initialSpringVelocity: 0, options: [], animations: {
                    self.likeIcon.image = UIImage(named: "heart_fill")
                    self.likesCount.textColor = UIColor.red
                    self.likesCount.text = self.likesCount.text
                    self.likeIcon.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
                })
                UIView.transition(with: likesCount, duration: 0.5, options: .transitionFlipFromBottom, animations: {})
            case .noLike:
                UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.35, initialSpringVelocity: 0, options: [], animations: {
                    self.likeIcon.image = UIImage(named: "heart")
                    self.likesCount.textColor = UIColor.darkText

                    self.likeIcon.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
                })
                UIView.transition(with: likesCount, duration: 0.5, options: .transitionFlipFromTop, animations: {})
            }
        }
    }
    let likeIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

    let likesCount = UILabel(frame: CGRect(x: 40, y: 0, width: (30 * 3), height: 30))
    
    
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(likesCount)
        addSubview(likeIcon)
        
        likeIcon.image = UIImage(named: "heart")
        likesCount.textColor = UIColor.darkText
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(tapOnLike(guestRecogniser:)))
        addGestureRecognizer(gr)
    }
    
    @objc func tapOnLike(guestRecogniser: UITapGestureRecognizer) {
        onTap?()
    }

}
