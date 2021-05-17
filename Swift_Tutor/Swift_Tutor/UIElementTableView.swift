//
//  ComponentView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation



import UIKit


class UIElementTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .grouped)
        
        // Use autoLayout for this tableView
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Register cell with Id: id_Cell_Category
        self.register(UIElementCell.self, forCellReuseIdentifier: Table.IdCell.uiElement)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
