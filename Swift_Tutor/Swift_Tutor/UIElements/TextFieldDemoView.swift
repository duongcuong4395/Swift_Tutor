//
//  TextFieldDemoView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/30/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import SnapKit
import UIKit

enum TextField_Properties {
    case placeholder
    case normalText
    case autoCorrectionType
    case keyBoardType
    case returnKeyType
    case clearButtonMode
    case alignment
    case delegate
}

class TextFieldDemoView: UIView {
    
    var textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField() {
        
    }
}
