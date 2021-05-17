//
//  GItTableViewCell.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import UIKit
import SnapKit

class GitTableViewCell : ItemCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.git)
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
