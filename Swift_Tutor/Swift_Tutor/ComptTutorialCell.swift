//
//  ComptTutorialCell.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/23/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit
import SnapKit

class ComptTutorialTableViewCell: ItemCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.uiElement)
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
