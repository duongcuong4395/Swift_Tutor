//
//  CatService.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 5/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import Alamofire

class CatService: HttpService {
    var SessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return SessionManager.request(urlRequest).validate(statusCode: 200..<550)
    }
}
