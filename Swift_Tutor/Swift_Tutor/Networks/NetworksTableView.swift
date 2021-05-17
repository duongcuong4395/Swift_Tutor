//
//  NetworksTableView.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import UIKit


class NetworksTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: CGRect.zero, style: .grouped)
        
        // Use autoLayout for this tableView
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Register cell with Id
        self.register(NetworksTableViewCell.self, forCellReuseIdentifier: Table.IdCell.network)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
