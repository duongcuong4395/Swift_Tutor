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

class Table {
    class IdCell {
         static var category = "id_TableCell_Category"
         static var uiElement = "id_TableCell_UIElement"
         static var compTutorial = "id_TableCell_CompTutorial"
         static var iOSFrameworks = "id_TableCell_IOSFrameworks"
         static var git = "id_TableCell_Git"
         static var network = "id_TableCell_Network"
        
        
        class Git {
            static var base = "id_TableCell_GitBase"
            static var advance = "id_TableCell_GitAdvance"
        }
    }
    
    class Id {
         static var category = "id_Table_Category"
         static var uiElement = "id_Table_UIElement"
         static var compTutorial = "id_Table_CompTutorial"
         static var iOSFrameworks = "id_Table_IOSFrameworks"
         static var git = "id_Table_Git"
         static var network = "id_Table_Network"
        
        class Git {
            static var base = "id_Table_GitBase"
            static var advance = "id_Table_GitAdvance"
        }
    }

}




class ItemCell: UITableViewCell {
    
    var imageUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    func setupCell() {
        setupConstraintsImageUIImage()
        setupConstraintsNameLabel()
        
    }
    
    // MARK: Constrains
    
    func setupConstraintsNameLabel() {
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(imageUIImage.snp.trailing).offset(2)
            
        }
    }
    
    func setupConstraintsImageUIImage() {
        contentView.addSubview(imageUIImage)
        
        imageUIImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(2)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
}



class HorizontalItemView: UIView {
    
    var imageUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        setupConstraintsImageUIImage()
        setupConstraintsNameLabel()
        
    }
    
    // MARK: Constrains
    
    func setupConstraintsNameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(imageUIImage.snp.trailing).offset(2)
            
        }
    }
    
    func setupConstraintsImageUIImage() {
        self.addSubview(imageUIImage)
        
        imageUIImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(2)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
}



class VerticalItemView: UIView {
    
    var imageUIImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        setupConstraintsNameLabel()
        setupConstraintsImageUIImage()
    }
    
    // MARK: Constrains
    
    func setupConstraintsNameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-1)
            make.leading.equalTo(self.snp.leading).offset(1)
            make.trailing.equalTo(self.snp.trailing).offset(-1)
            
        }
    }
    
    func setupConstraintsImageUIImage() {
        self.addSubview(imageUIImage)
        
        imageUIImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(1)
            make.leading.equalTo(self.snp.leading).offset(1)
            make.trailing.equalTo(self.snp.trailing).offset(-1)
            make.bottom.equalTo(nameLabel.snp.top).offset(-1)
            
        }
    }
}
