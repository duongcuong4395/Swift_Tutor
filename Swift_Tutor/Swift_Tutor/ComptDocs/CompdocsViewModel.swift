//
//  CompdocsViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/23/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation



import UIKit

class CompdocsViewModel {
    let compdocsModel = CompdocsModel(docsLink: "")
    
    var dataSource : DynamicValue<CompdocsModel>
    
    init() {
        
        
        self.dataSource = DynamicValue<CompdocsModel>(compdocsModel)
    }
    
    func updateLinks(link: String) {
        self.dataSource.value.docsLink = link
    }
}
