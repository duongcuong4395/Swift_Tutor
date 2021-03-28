//
//  Table.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/19/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit
import SnapKit

public class Table {
    public class IdCell {
        public static var category = "id_TableCell_Category"
        public static var component = "id_TableCell_Component"
        public static var compTutorial = "id_TableCell_CompTutorial"
        
    }
    
    public class Id {
        public static var category = "id_Table_Category"
        public static var component = "id_Table_Component"
        public static var compTutorial = "id_Table_CompTutorial"
    }

}




public class ItemCell: UITableViewCell {
    
    public var imageUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    public func setup_Cell() {
        setup_Constraints_ImageUIImage()
        setup_Constraints_NameLabel()
        
    }
    
    // MARK: Constrains
    
    public func setup_Constraints_NameLabel() {
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(imageUIImage.snp.trailing).offset(2)
            
        }
    }
    
    public func setup_Constraints_ImageUIImage() {
        contentView.addSubview(imageUIImage)
        
        imageUIImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(2)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
}



public class HorizontalItemView: UIView {
    
    public var imageUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup_Cell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup_Cell() {
        setup_Constraints_ImageUIImage()
        setup_Constraints_NameLabel()
        
    }
    
    // MARK: Constrains
    
    public func setup_Constraints_NameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(imageUIImage.snp.trailing).offset(2)
            
        }
    }
    
    public func setup_Constraints_ImageUIImage() {
        self.addSubview(imageUIImage)
        
        imageUIImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(2)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
}



public class VerticalItemView: UIView {
    
    public var imageUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup_Cell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup_Cell() {
        setup_Constraints_NameLabel()
        setup_Constraints_ImageUIImage()
    }
    
    // MARK: Constrains
    
    public func setup_Constraints_NameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-1)
            make.leading.equalTo(self.snp.leading).offset(1)
            make.trailing.equalTo(self.snp.trailing).offset(-1)
            
        }
    }
    
    public func setup_Constraints_ImageUIImage() {
        self.addSubview(imageUIImage)
        
        imageUIImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(1)
            make.leading.equalTo(self.snp.leading).offset(1)
            make.trailing.equalTo(self.snp.trailing).offset(-1)
            make.bottom.equalTo(nameLabel.snp.top).offset(-1)
            
        }
    }
}
