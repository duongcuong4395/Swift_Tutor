//
//  URLSessionViewModel.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/21/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import UIKit


/// Dog endpoint
enum DogsEndpoint {
    /// Lists all the books.
    case index
    /// Fetches a book with a given identifier.
    case get(identifier: String)
    /// Creates a book with the given parameters.
    case create(parameters: [String: Any?])
}

extension DogsEndpoint: RequestProtocol {
    var path: String {
        switch self {
        case .index:
            return "/breeds/image/random"
        case .get(let identifier):
            return "/books/\(identifier)"
        case .create(_):
            return "/breeds/image/random"
        }
    }

    var method: RequestMethod {
        switch self {
        case .index:
            return .get
        case .get(_):
            return .get
        case .create(_):
            return .post
        }
    }

    var headers: ReaquestHeaders? {
        return nil
    }

    var parameters: RequestParameters? {
        switch self {
        case .index:
            return nil
        case .get(_):
            return nil
        case .create(let parameters):
            return parameters
        }
    }

    var requestType: RequestType {
        return .data
    }

    var responseType: ResponseType {
        return .json
    }

    var progressHandler: ProgressHandler? {
        get { nil }
        set { }
    }
}

class URLSessionViewModel {
    
    let dogModel = DogModel()
    
    var dataSourceDog : DynamicValue<DogModel>?
    
    let requestDispatcher = APIRequestDispatcher(environment: APIEnvironment.development, networkSession: APINetworkSession())
    let params: [String : Any] = [
       "name": "Gone with the wind",
       "author": "Margaret Mitchell"
    ]

    
    
    
    init() {
        self.dataSourceDog = DynamicValue<DogModel>(dogModel)
    }
    
    func getDataByGetRequest() {
        self.dataSourceDog?.value.isLoading = true
        
        let dogsRequest = DogsEndpoint.index

        let dogOperation = APIOperation(dogsRequest)
        dogOperation.execute(in: requestDispatcher) { result in
            print("Dog response", result)
            
            
            
            switch result {
                
            case .json(let data, _):
                print("Dog Data", data as Any)
                let jsonData = try! JSONSerialization.data(withJSONObject: data as Any, options: .prettyPrinted)
                // here "jsonData" is the dictionary encoded in JSON data
                let dogModel = try! JSONDecoder().decode(DogModel.self, from: jsonData)
                print("Dpg Link", dogModel.message as Any)
                
                self.dataSourceDog?.value = dogModel
                self.dataSourceDog?.value.isLoading = false
                break
            case .file(_, _): break
                
            case .error(_, _): break
                
            }
        }
    }

    
}


