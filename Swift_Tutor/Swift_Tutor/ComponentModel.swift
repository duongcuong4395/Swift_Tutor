//
//  ComponentModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

public class UIFwModel {
    public var docsLink : String?
    public var exampleLink : String?
}

public class ComponentModel: ItemModel {
  
    public var comUiKit = UIFwModel()
    public var comSwiftUi = UIFwModel()
    
    override init(name : String, image : String) {
        super.init(name: name, image: image)
        
    }
}


