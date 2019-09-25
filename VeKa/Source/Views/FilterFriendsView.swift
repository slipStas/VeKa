//
//  FilterFriendsView.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 25.09.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FilterFriendsView: UIView {
    
    var charracterArray : [String] = []
    var viewsArray : [UILabel] = []

    let filterView = UIStackView(frame: CGRect(x: 0, y: 0, width: 10, height: 200))
    
    var onScroll : (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(filterView)
        addCharViews()
        
        self.backgroundColor = .clear
        filterView.frame = bounds
        
        let gr = UIPanGestureRecognizer(target: self, action: #selector(panOnScroll))
        addGestureRecognizer(gr)
        
    }
    @objc func panOnScroll() {
        onScroll?()
    }
    
    func addView() {
        for i in charracterArray {
            let newLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            newLabel.text = i
            viewsArray.append(newLabel)
        }
    }
    
    func addCharViews() {
        for i in viewsArray {
            filterView.addSubview(i)
        }
    }

}
