//
//  Item.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


public class ItemModel {
  
    public var name : String?
    public var image : String?
    
    init(name : String, image : String) {
        self.name = name
        self.image = image
    }
}
