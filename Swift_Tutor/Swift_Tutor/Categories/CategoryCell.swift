//
//  CategoryCell.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/18/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit
import SnapKit

class CategoryTableViewCell: ItemCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.category)
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
