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
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupButton() {
        setupButtonConstrains()
        setupButtonEvents(buttonEvent: .reset)
        setupButtonEvents(buttonEvent: .shadow)
        setupButtonEvents(buttonEvent: .boder)
        setupButtonEvents(buttonEvent: .action)
        setupButtonEvents(buttonEvent: .image)
        
    }
    
    // MARK: Constrains
    func setupButtonConstrains() {
        
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
    
    func setupButtonEvents(buttonEvent: ButtonEvent)  {
        switch buttonEvent {
        case .reset:
            setupButtondefault()
        case .boder:
            setupButtonBorder()
        case .action:
            setupButtonAction()
        case .shadow:
            setupButtonShadow()
        case .image:
            setupButtonImage()
        }
    }
    
    private func setupButtondefault() {
        button.titleWith(title: "Button Default", color: .black, state: .normal)
    }
    
    private func setupButtonBorder() {
        buttonBorder.titleWith(title: "Button with border", color: .black, state: .normal)
        buttonBorder.borderWith(width: 1, color: UIColor.black.cgColor)
        
        buttonBorder.layer.cornerRadius = 5
    }
    
    private func setupButtonShadow() {
        buttonShadow.titleWith(title: "Button with Shadow", color: .black, state: .normal)
        buttonShadow.borderWith(width: 1, color: UIColor.black.cgColor)
        buttonShadow.shadowWith(color: UIColor.brown.cgColor, offset: CGSize(width: 0.0, height: 3.0), opacity: 1.0, radius: 2)
        
        buttonShadow.layer.cornerRadius = 5
    }
    
    private func setupButtonAction() {
        buttonAtion.titleWith(title: "Button with Touch", color: .black, state: .normal)
        buttonAtion.borderWith(width: 1, color: UIColor.black.cgColor)
        buttonAtion.shadowWith(color: UIColor.black.cgColor, offset: CGSize(width: 0.0, height: 2.0), opacity: 1.0, radius: 1)
        buttonAtion.addTarget(self, action: #selector(buttonAtionTouch), for: .touchDown)
    }
    
    @objc func buttonAtionTouch() {
        let alert = UIAlertController(title: "Alert",message:"This Botton Touched",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",style:UIAlertAction.Style.default,handler: nil))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    private func setupButtonImage() {
        buttonImage.titleWith(title: "Button with image", color: .black, state: .normal)
        buttonImage.borderWith(width: 1, color: UIColor.black.cgColor)
        buttonImage.shadowWith(color: UIColor.black.cgColor, offset: CGSize(width: 0.0, height: 2.0), opacity: 1.0, radius: 1)
        buttonImage.imageWith(img: UIImage(named: "cool")!, control: .normal)
    }
}
