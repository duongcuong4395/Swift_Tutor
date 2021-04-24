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
        setup_Cell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup_Cell() {
        super.setup_Cell()
    }
    
    // MARK: Constrains
    
    override func setup_Constraints_NameLabel() {
        super.setup_Constraints_NameLabel()
    }
    
    override func setup_Constraints_ImageUIImage() {
        super.setup_Constraints_ImageUIImage()
    }
}
