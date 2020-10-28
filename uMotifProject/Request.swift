//
//  Request.swift
//  uMotifProject
//
//  Created by Melvin Wijenayaka on 14/10/2020.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var base: String { get }
    var path: String { get }
    var queries: [URLQueryItem]? { get }
}
extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = base
        components.path = path
        components.queryItems = queries
        return components
    }
    
    var request: URLRequest? {
        guard let url = urlComponents.url else { return nil }
        return URLRequest(url: url)
    }
}

enum JokesRequest {
    case random(explictJokes: ExplictJokesState)
}

extension JokesRequest: Endpoint {
    
    var path: String {
        switch self {
            case .random(_):
                return "/jokes/random/15"
        }
    }
    
    var queries: [URLQueryItem]? {
        switch self {
            case .random(let explictJokes):
                switch explictJokes {
                    case .include:
                        return nil
                    case .exclude:
                        return [URLQueryItem(name: "exclude", value: "[explicit]")]
                }
        }
    }
    
    var base: String { return "api.icndb.com" }
    
    var scheme: String { return "https" }
    
}
