//
//  CategoryModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/18/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

// MARK: CategoryModel

class CategoryModel : ItemModel {

    override init(name : String, image : String, links: [String]) {
        super.init(name: name, image: image, links: links)
    }
}
