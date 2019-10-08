//
//  CustomNavigationController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 08.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    let pushAnimator = CustomPushTransitionAnimator()
    let popAnimator = CustomPopTransitionAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
    //MARK - UINavigationControllerDelegate
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            return pushAnimator
        case .pop:
            return popAnimator
        case .none:
            return nil
        @unknown default:
            fatalError()
        }
    }
}
