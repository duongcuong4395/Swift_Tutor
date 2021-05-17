//
//  HttpService.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/13/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation


import Alamofire

protocol HttpService {
    var SessionManager : Session { get }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
    
}
