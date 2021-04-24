//
//  GitBaseTableView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import UIKit


class GitBaseTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .grouped)
        
        // Use autoLayout for this tableView
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Register cell with Id: id_Cell_Category
        self.register(GitBaseTableViewCell.self, forCellReuseIdentifier: Table.IdCell.Git.base)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
