//
//  CityViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/25/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import UIKit
import RxSwift

class CatViewModel {
    
    let catElementModel = CatElement()
    var dataSourceCat : DynamicValue<CatElement>?
    
    //private let citiesService: CitiesAPI
    private  let bag = DisposeBag()
    let catsService = CatsService.shared
    
    init() {
        self.dataSourceCat = DynamicValue<CatElement>(catElementModel)
        
        //self.dataSource?.data.value = self.listModel
        
        //self.citiesService = citiesService
        //process()
    }
    
    func process() -> Void {
        self.catsService
            .fetchCats()
            .map({ (cat) in
                self.dataSourceCat?.value = cat[0]
            })
            .subscribe()
            .disposed(by: bag)
        
        /*
        self.catsService.createCat()
            .map({ (cat) in
                //self.dataSourceCat?.value = cat[0]
            })
            .subscribe()
            .disposed(by: bag)
        */
    }
    
    
}
