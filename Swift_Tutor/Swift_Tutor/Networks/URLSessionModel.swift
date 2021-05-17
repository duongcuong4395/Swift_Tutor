//
//  URLSessionModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//


// MARK: URLSessionModel

class URLSessionModel : ItemModel {

    override init(name : String, image : String, links: [String]) {
        super.init(name: name, image: image, links: links)
    }
}


class DogModel: Codable {
    var message : String?
    var status : String?
    
    var isLoading: Bool?
    
}
