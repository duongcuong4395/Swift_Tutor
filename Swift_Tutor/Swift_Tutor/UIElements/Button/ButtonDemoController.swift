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
        
        setupViews()
    }
    
    func setupViews() {
        
        // setup for buttonDemoView
        setupButtonDemoView()
    }
    
    private func setupButtonDemoView() {
        self.view.addSubview(buttonDemoView)
        
        buttonDemoView.snp.makeConstraints({ (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        })
    }
}
