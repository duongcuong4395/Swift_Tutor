//
//  CatHttpRouter.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 5/16/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


import Alamofire

enum CatHttpRouter {
    case getCats
    case createCat
    
}


extension CatHttpRouter : HttpRouter {
    var baseURLString: String {
        return "https://api.thecatapi.com/v1"
    }
    
    var path: String {
        switch self {
        case .getCats:
            return "/images/search"
        case .createCat:
            return "/images/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCats:
            return .get
        case .createCat:
            return .post
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getCats:
            return ["param1": (Any).self]
        case .createCat:
            return ["param1": (Any).self]
        }
    }
    
}
