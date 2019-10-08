//
//  CustomSegue.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 08.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    let duration: TimeInterval = 0.35
    
    override func perform() {
        
        let width = source.view.bounds.width
        let height = source.view.frame.height
        
        guard let containerView = source.view else {return}
        containerView.addSubview(destination.view)
        source.view.frame = containerView.frame
        destination.view.frame = containerView.frame
        destination.view.transform = CGAffineTransform(translationX: width, y: height)
        
        UIView.animate(withDuration: duration, animations: {
            self.destination.view.transform = .identity
        }, completion: { _ in
            self.source.present(self.destination, animated:  false)})
    }
    
}
