//
//  ButtonDemoView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/28/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import SnapKit
import UIKit

extension UIButton {
    func title_With(title: String, color: UIColor, state: UIControl.State) {
        let button = self // changes made here
        button.setTitle(title, for: state)
        button.setTitleColor(.black, for: state)
    }
    
    func border_With(width: CGFloat, color: CGColor) {
        let button = self // changes made here
        button.layer.borderWidth = width
        button.layer.borderColor = color
    }
    
    func shadow_With(color: CGColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        let button = self // changes made here
        button.layer.shadowColor = color
        button.layer.shadowOffset = offset
        button.layer.shadowOpacity = opacity
        button.layer.shadowRadius = radius
    }
    
    func image_With(img: UIImage, control: UIControl.State)  {
        let button = self // changes made here
        button.setImage(img, for: control)
    }
    
    func background_With(color: UIColor, img: UIImage, control: UIControl.State)  {
        let button = self // changes made here
        button.setBackgroundImage(img, for: control)
        button.backgroundColor = color
    }
    
}

enum ButtonEvent {
    case reset
    case action
    case boder
    case shadow
    case image
}

class ButtonDemoView: UIView {
    
    var button = UIButton()
    var buttonShadow = UIButton()
    var buttonBorder = UIButton()
    var buttonAtion = UIButton()
    var buttonImage = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setup_Button()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup_Button() {
        setup_Button_Constrains()
        
        
        setup_Button_Events(buttonEvent: .reset)
        setup_Button_Events(buttonEvent: .shadow)
        setup_Button_Events(buttonEvent: .boder)
        setup_Button_Events(buttonEvent: .action)
        setup_Button_Events(buttonEvent: .image)
        
    }
    
    // MARK: Constrains
    func setup_Button_Constrains() {
        
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(50)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
        
        self.addSubview(buttonBorder)
        buttonBorder.snp.makeConstraints { (make) in
            make.top.equalTo(self.button.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
            
        }
        
        self.addSubview(buttonShadow)
        buttonShadow.snp.makeConstraints { (make) in
            make.top.equalTo(self.buttonBorder.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
        
        self.addSubview(buttonImage)
        buttonImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.buttonShadow.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.height.equalTo(100)
        }
        
        self.addSubview(buttonAtion)
        buttonAtion.snp.makeConstraints { (make) in
            make.top.equalTo(self.buttonImage.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
    }
    
    // MARK: Events
    
    func setup_Button_Events(buttonEvent: ButtonEvent)  {
        switch buttonEvent {
        case .reset:
            setup_Button_default()
        case .boder:
            setup_Button_Border()
        case .action:
            setup_Button_Action()
        case .shadow:
            setup_Button_Shadow()
        case .image:
            setup_Button_Image()
        }
    }
    
    func setup_Button_default() {
        button.title_With(title: "Button Default", color: .black, state: .normal)
    }
    
    
    func setup_Button_Border() {
        buttonBorder.title_With(title: "Button with border", color: .black, state: .normal)
        buttonBorder.border_With(width: 1, color: UIColor.black.cgColor)
        
        buttonBorder.layer.cornerRadius = 5
    }
    
    func setup_Button_Shadow() {
        buttonShadow.title_With(title: "Button with Shadow", color: .black, state: .normal)
        buttonShadow.border_With(width: 1, color: UIColor.black.cgColor)
        buttonShadow.shadow_With(color: UIColor.brown.cgColor, offset: CGSize(width: 0.0, height: 3.0), opacity: 1.0, radius: 2)
        
        buttonShadow.layer.cornerRadius = 5
    }
    
    func setup_Button_Action() {
        buttonAtion.title_With(title: "Button with Touch", color: .black, state: .normal)
        buttonAtion.border_With(width: 1, color: UIColor.black.cgColor)
        buttonAtion.shadow_With(color: UIColor.black.cgColor, offset: CGSize(width: 0.0, height: 2.0), opacity: 1.0, radius: 1)
        buttonAtion.addTarget(self, action: #selector(buttonAtion_Touch), for: .touchDown)
    }
    
    @objc func buttonAtion_Touch() {
        let alert = UIAlertController(title: "Alert",message:"This Botton Touched",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",style:UIAlertAction.Style.default,handler: nil))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func setup_Button_Image() {
        buttonImage.title_With(title: "Button with image", color: .black, state: .normal)
        buttonImage.border_With(width: 1, color: UIColor.black.cgColor)
        buttonImage.shadow_With(color: UIColor.black.cgColor, offset: CGSize(width: 0.0, height: 2.0), opacity: 1.0, radius: 1)
        buttonImage.image_With(img: UIImage(named: "cool")!, control: .normal)
    }
}
