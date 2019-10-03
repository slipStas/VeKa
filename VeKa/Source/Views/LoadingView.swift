//
//  LoadingView.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 03.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

let circlesCount = 10
let heightWidthOfSubViews = 10
let distanceBeetwenSubViews = heightWidthOfSubViews * 3

class Circle: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: CGRect(x: heightWidthOfSubViews / 2, y: heightWidthOfSubViews / 2, width: heightWidthOfSubViews, height: heightWidthOfSubViews))
        UIColor.yellow.setStroke()
        UIColor.red.setFill()
        path.lineWidth = 2
        path.stroke()
        path.fill()
    }
}

class LoadingView: UIView {
    
    var views: [Circle] = []
    var lastCoordinateX = 0
    
    private func addMyViews() {
        
        for _ in 0..<circlesCount {
            let view = Circle(frame: CGRect(x: lastCoordinateX + (heightWidthOfSubViews / 2), y: heightWidthOfSubViews / 2, width: heightWidthOfSubViews + 10, height: heightWidthOfSubViews + 10))
            view.tintColor = .black
            view.backgroundColor = .clear
            view.alpha = 0.1
            views.append(view)
            lastCoordinateX += distanceBeetwenSubViews
        }
    }
    
    private func animation() {
        let delay = views.count
        var count = 0
        
        for i in views {
            UIView.animate(withDuration: 0.55, delay: Double(count) / Double(delay), options: [.repeat, .autoreverse], animations: {
                i.alpha = 0.7
                i.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
                count += 1
            })
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addMyViews()
        for i in views {
            addSubview(i)
        }
        
        backgroundColor = .clear
        animation()
    }
}
