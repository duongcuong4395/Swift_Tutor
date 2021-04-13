//
//  ToolBarViewController.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/31/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit
import SnapKit


class ToolBarViewController: UIViewController {
    
    var toolBar = UIToolbar()
    var items = [UIBarButtonItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Toolbar"
        self.view.backgroundColor = .white
        
        setup_views()
    }
    
    func setup_views() {
        setup_Constrains_ToolBar()
        setup_ToolBar()
    }
    
    func setup_Constrains_ToolBar() {
        self.view.addSubview(toolBar)
        
        toolBar.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.view.snp.top).offset(0)
            make.leading.equalTo(self.view.snp.leading).offset(0)
            make.trailing.equalTo(self.view.snp.trailing).offset(0)
            //make.bottom.equalTo(self.view.snp.bottom).offset(0)
        }
    }
    
    func setup_ToolBar() {
        
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onClickedToolbeltButton))
        )
        
        toolBar.setItems(items, animated: true)
    }
    
    @objc func onClickedToolbeltButton() {
        print("Click bar button Item: add")
    }
}
