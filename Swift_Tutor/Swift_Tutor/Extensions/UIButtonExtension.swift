//
//  UIButtonExtension.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/6/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

extension UIButton {
    func titleWith(title: String, color: UIColor, state: UIControl.State) {
        let button = self // changes made here
        button.setTitle(title, for: state)
        button.setTitleColor(color, for: state)
    }
    
    func borderWith(width: CGFloat, color: CGColor) {
        let button = self // changes made here
        button.layer.borderWidth = width
        button.layer.borderColor = color
    }
    
    func shadowWith(color: CGColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        let button = self // changes made here
        button.layer.shadowColor = color
        button.layer.shadowOffset = offset
        button.layer.shadowOpacity = opacity
        button.layer.shadowRadius = radius
    }
    
    func imageWith(img: UIImage, control: UIControl.State)  {
        let button = self // changes made here
        button.setImage(img, for: control)
    }
    
    func backgroundWith(color: UIColor, img: UIImage, control: UIControl.State)  {
        let button = self // changes made here
        button.setBackgroundImage(img, for: control)
        button.backgroundColor = color
    }
    
}

