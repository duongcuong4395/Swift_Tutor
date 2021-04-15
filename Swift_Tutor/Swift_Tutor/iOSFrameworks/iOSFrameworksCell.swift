//
//  iOSFrameworksCell.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/6/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit
import SnapKit

class IOSFrameworksCell: ItemCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Table.IdCell.iOSFrameworks)
        
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
