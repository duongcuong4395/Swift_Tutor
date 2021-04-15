//
//  CoreAnimationViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/6/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

class CoreAnimationViewController: UIViewController {
    
    let zoomImageView = UIImageView()
    let startingFrame = CGRect(x: 0, y: 100, width: 200, height: 100)
    
    let imageViewZoom = UIImageView()
    let blackBackgroundView = UIView()
    var imageViewResize: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Themes.backgroundCorlor
        self.title = Title.iosFrameworks.coreAnimation
        
        zoomImageView.isUserInteractionEnabled = true
        zoomImageView.frame = startingFrame
        zoomImageView.image = UIImage(named: "cool")
        zoomImageView.contentMode = .scaleAspectFill
        zoomImageView.clipsToBounds = true
        
        
        zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animation)))
        
        view.addSubview(zoomImageView)
    }
    
    @objc func animation() {
        zoomInAnimateImageVIew(imageView: self.zoomImageView)
    }
    
    func zoomInAnimateImageVIew(imageView: UIImageView) {
        self.imageViewResize = imageView
        if let startingFrame = imageView.superview?.convert(imageView.frame, to: nil) {
            
            imageView.alpha = 0
            blackBackgroundView.frame = self.view.frame
            blackBackgroundView.backgroundColor = .black
            blackBackgroundView.alpha = 0
            view.addSubview(blackBackgroundView)
            
            imageViewZoom.frame = startingFrame
            imageViewZoom.isUserInteractionEnabled = true
            imageViewZoom.image = imageView.image
            imageViewZoom.contentMode = .scaleAspectFill
            imageViewZoom.clipsToBounds = true
            view.addSubview(imageViewZoom)
            
            imageViewZoom.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOutAnimateImageVIew)))
            
            UIView.animate(withDuration: 0.75) { () -> Void in
                
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                
                self.imageViewZoom.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                
                self.blackBackgroundView.alpha = 1
            }
        }
    }
    
    @objc func zoomOutAnimateImageVIew() {
        if let startingFrame = imageViewResize!.superview?.convert(imageViewResize!.frame, to: nil) {
            
            UIView.animate(withDuration: 0.75, animations: {
                self.imageViewZoom.frame = startingFrame
                self.blackBackgroundView.alpha = 0
            }) { (didComplete) in
                self.imageViewZoom.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.imageViewResize?.alpha = 1
            }
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
