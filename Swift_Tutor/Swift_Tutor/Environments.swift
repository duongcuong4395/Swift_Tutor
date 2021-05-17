//
//  Environments.swift
//  Swift_Tutor
//
//  Created by Duong Cuong on 4/22/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

/*
 In most cases, team will work with different servers that expose the same API at different URLs and
 every commit will have to be integrated and tested against these environments to make sure everything works fine.

 Environments:
 (Configuration Changes) => Development => (Promote Changes) => Staging => (Approve Changes) => Production
 */

/// Protocol to which environments must conform.
protocol EnvironmentProtocol {
    /// The default HTTP request headers for the environment.
    var headers: ReaquestHeaders? { get }

    /// The base URL of the environment.
    var baseURL: String { get }
}

/// Environments enum.
enum APIEnvironment: EnvironmentProtocol {
    /// The development environment.
    case development
    /// The production environment.
    case production

    /// The default HTTP request headers for the given environment.
    var headers: ReaquestHeaders? {
        switch self {
        case .development:
            return [
                "Content-Type" : "application/json"
                //, "Authorization" : "Bearer yourBearerToken" (IF HAS)
            ]
        case .production:
            return [:]
        }
    }

    /// The base URL of the given environment.
    var baseURL: String {
        switch self {
        case .development:
            return "https://dog.ceo/api"
        case .production:
            return "https://dog.ceo/api"
        }
    }
}
