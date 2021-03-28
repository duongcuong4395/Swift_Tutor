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
}

class ButtonDemoView: UIView {
    
    var button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup_Button()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup_Button() {
        setup_Button_Constrains()
        
        setup_Button_Events(buttonEvent: .reset)
    }
    
    // MARK: Constrains
    func setup_Button_Constrains() {
        self.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
    }
    
    // MARK: Events
    
    func setup_Button_Events(buttonEvent: ButtonEvent)  {
        switch buttonEvent {
        case .action:
            print("Action button")
            // do something
        case .boder:
            print("Border button")
        case .reset:
            print("Reset button")
        case .shadow:
            print("Shadow button")
            // do something
        }
    }
    
    func setup_Button_default() {
        
    }
    
    func setup_Button_Action() {
        
    }
    
    func setup_Button_Border() {
        
    }
    
}
