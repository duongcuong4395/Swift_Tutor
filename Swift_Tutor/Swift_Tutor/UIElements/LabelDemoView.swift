//
//  LabelDemoView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/30/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import SnapKit
import UIKit



enum Label_Properties {
    case textAlignment
    case textColor
    case numberOflines
    case lineBreakMode
}

class LabelDemoView: UIView {
    
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup_Label()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup_Label() {
        setup_Constrains_Label()
        
    }
    
    func setup_Constrains_Label() {
        self.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
    }
    
    func setup_Properties_Label()  {
        label.text = "This is label"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .brown
        label.textColor = .blue
        label.lineBreakMode = .byTruncatingMiddle
    }
}
