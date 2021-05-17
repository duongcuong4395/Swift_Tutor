//
//  NetworksTableViewCell.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import UIKit
import SnapKit

class NetworksTableViewCell: ItemCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.network)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupCell() {
        super.setupCell()
    }
    
    // MARK: Constrains
    
    override func setupConstraintsNameLabel() {
        super.setupConstraintsNameLabel()
    }
    
    override func setupConstraintsImageUIImage() {
        super.setupConstraintsImageUIImage()
    }
}
