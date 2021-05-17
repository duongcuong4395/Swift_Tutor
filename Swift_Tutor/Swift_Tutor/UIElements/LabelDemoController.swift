//
//  LabelDemoController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/8/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation



import SnapKit
import UIKit

class LabelDemoController: UIViewController {
    
    var labelDemoView = LabelDemoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
        // setup for labelDemoView
        setupLabelDemoView()
    }
    
    private func setupLabelDemoView() {
        self.view.addSubview(labelDemoView)
        
        labelDemoView.snp.makeConstraints({ (make) in
            make.top.leading.trailing.bottom.equalTo(self.view)
        })
    }
}
