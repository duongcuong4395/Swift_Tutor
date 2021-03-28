//
//  ComptTutorialModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


// MARK: ComptTutorialModel

public class ComptTutorialModel : ItemModel {

    public var componentName : String?
    
    override init(name : String, image : String) {
        super.init(name: name, image: image)
    }
}
