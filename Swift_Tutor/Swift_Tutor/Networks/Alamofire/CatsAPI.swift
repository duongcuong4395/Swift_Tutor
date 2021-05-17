//
//  CatsAPI.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 5/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import RxSwift

/// https://countriesnow.space/api/v0.1/countries/positions
protocol CatsAPI {
    func fetchCats() -> Observable<[CatElement]>
    
    func createCat() -> Observable<[CatElement]>
}
