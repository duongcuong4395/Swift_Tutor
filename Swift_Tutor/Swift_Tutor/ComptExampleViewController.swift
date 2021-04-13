//
//  ComptExampleViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/23/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import SnapKit
import UIKit

class ComptExampleViewController: UIViewController {
    
    var buttonDemoView = ButtonDemoView()
    var labelDemoView = LabelDemoView()
    var textFieldDemoView = TextFieldDemoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
