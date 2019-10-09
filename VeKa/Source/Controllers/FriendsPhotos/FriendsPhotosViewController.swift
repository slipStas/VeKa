//
//  FriendsPhotosViewController.swift
//  VeKa
//
//  Created by Stanislav Slipchenko on 05.10.2019.
//  Copyright © 2019 Stanislav Slipchenko. All rights reserved.
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    let viewNew = UIImageView()
    let blackBackgroundView = UIView()
    var imageView: UIImageView?
    let nawBar = UIView()
    
    var photoArray: [UIImage] = []
    
    @IBOutlet weak var friendsPhotosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsPhotosCollectionView.dataSource = self
        
        let backgroundColor = #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 0.5)
        let width = (view.frame.width - 20) / 3
        let layout = friendsPhotosCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        friendsPhotosCollectionView.backgroundColor = backgroundColor
    }
    
    func animateImageView(imageView: UIImageView) {
        self.imageView = imageView
        if let startingFrame = imageView.superview?.convert(imageView.frame, to: nil) {
            
            blackBackgroundView.frame = self.view.frame
            blackBackgroundView.backgroundColor = .black
            blackBackgroundView.alpha = 0
            
            view.addSubview(blackBackgroundView)
            
            nawBar.frame = CGRect(x: 0, y: 0, width: 1000, height: 44 + 44)
            nawBar.backgroundColor = .black
            nawBar.alpha = 0
            
            if let keyWindow = UIApplication.shared.windows.last {
                keyWindow.addSubview(nawBar)
            }
            
            imageView.alpha = 0
            
            viewNew.isUserInteractionEnabled = true
            viewNew.image = imageView.image
            viewNew.frame = startingFrame
            viewNew.contentMode = .scaleAspectFit
            viewNew.clipsToBounds = true
            view.addSubview(viewNew)
            
            viewNew.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOut)))
            
            UIView.animate(withDuration: 0.75) {
                
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                self.viewNew.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                self.blackBackgroundView.alpha = 1
                self.nawBar.alpha = 1
            }
        }
    }
    
    @objc func zoomOut() {
        if let startingFrame = imageView!.superview?.convert(imageView!.frame, to: nil) {
            UIView.animate(withDuration: 0.75, animations: {
                self.viewNew.frame = startingFrame
                self.blackBackgroundView.alpha = 0
                self.nawBar.alpha = 0
            }) { (didComplete) in
                self.viewNew.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.nawBar.removeFromSuperview()
                self.imageView?.alpha = 1
            }
        }
    }
}

extension FriendsPhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendsPhotosCollectionView.dequeueReusableCell(withReuseIdentifier: "friendsPhotosIdentifier", for: indexPath) as! FriendsPhotosCollectionViewCell
        
        cell.friendsPhotos.image = photoArray[indexPath.row]
        cell.vk = self
        
        return cell
    }
}

