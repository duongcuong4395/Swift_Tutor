//
//  cityModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/25/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cities = try Cities(json)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCities { response in
//     if let cities = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - CatElement
struct CatElement: Codable {
    var id: String = ""
    var url: String  = ""
    var width, height: Int?
}
