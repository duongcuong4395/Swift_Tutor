//
//  ButtonDemoController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/8/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import SnapKit
import UIKit

class ButtonDemoController: UIViewController {
    
    var buttonDemoView = ButtonDemoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup_Views()
    }
    
    func setup_Views() {
        
        // setup for buttonDemoView
        setup_buttonDemoView()
    }
    
    func setup_buttonDemoView() {
        self.view.addSubview(buttonDemoView)
        
        buttonDemoView.snp.makeConstraints({ (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        })
    }
}
