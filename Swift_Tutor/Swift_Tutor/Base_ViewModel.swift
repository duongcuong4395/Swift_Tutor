//
//  Base_ViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 3/20/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation

import UIKit

class ItemsViewModel<T> {
   
    var listModel: [T] = { return [] }()

    weak var dataSource : GenericDataSource<T>?

    init(dataSource : GenericDataSource<T>?) {
        self.dataSource = dataSource
    }
    
    
}
