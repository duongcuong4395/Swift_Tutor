//
//  ComptTutorialModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


// MARK: ComptTutorialModel

class ComptTutorialModel : ItemModel {

    var isHidden : Bool?
    
    override init(name : String, image : String, links : [String]) {
        super.init(name: name, image: image, links: links)
        self.isHidden = false
    }
}
