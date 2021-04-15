//
//  TextFieldDemoController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/8/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation



import SnapKit
import UIKit

class TextFieldDemoController: UIViewController {
    
    var textFieldDemoView = TextFieldDemoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup_Views()
    }
    
    func setup_Views() {
        
        // setup for textFieldDemoView
        setup_textFieldDemoView()
    }
    
    func setup_textFieldDemoView() {
        self.view.addSubview(textFieldDemoView)
        
        textFieldDemoView.snp.makeConstraints({ (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        })
    }
}
