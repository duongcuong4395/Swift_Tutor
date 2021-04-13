//
//  Item.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


class ItemModel {
  
    var name : String?
    var image : String?
    var links : [String]?
    
    init(name : String, image : String, links : [String]) {
        self.name = name
        self.image = image
        self.links  = links
    }
}
