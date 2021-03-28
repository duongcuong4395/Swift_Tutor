//
//  UIFrameworkViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

class UIFrameworkViewModel {
   
    let uiKitModel = UIFrameworkModel(name: Title.uiFramework.uiKit, image: Image.UiFramework.uiKit)
    let swiftUIModel = UIFrameworkModel(name: Title.uiFramework.swiftUI, image: Image.UiFramework.swiftUI)

    var listModel: [UIFrameworkModel] = { return [] }()
    var dataSource : DynamicValue<[UIFrameworkModel]>
    
    init() {
        
        uiKitModel.selected = true
        self.listModel.append(uiKitModel)
        
        self.listModel.append(swiftUIModel)
        self.dataSource = DynamicValue<[UIFrameworkModel]>(listModel)
    }
    func fetchUIFramework() {
        self.dataSource.value = self.listModel
    }
    
    func changeUIFramework(uiName: String) {
        self.dataSource.value = self.dataSource.value.map {
            if $0.name == uiName {
                $0.selected = true
            } else {
                $0.selected = false
            }
            return $0
        }
    }

}







