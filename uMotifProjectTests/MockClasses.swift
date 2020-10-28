//
//  MockClasses.swift
//  uMotifProjectTests
//
//  Created by Melvin Wijenayaka on 14/10/2020.
//

import Foundation
import UIKit
@testable import uMotifProject

class MockRequest: Endpoint {
    
    enum State {
        case valid
        case invalid
    }
    
    var state: State = .invalid
    
    var scheme: String {
        return "http"
    }
    
    var base: String {
        switch state {
            case .valid: return "google.com"
            case .invalid: return ""
        }
    }
    
    var path: String {
        return String()
    }
    
    var queries: [URLQueryItem]? {
        nil
    }
    
    
}

class MockJokesClient: APIClient {
    
    var mockResult: Result<Data, APIError>
    
    var session: URLSession
    
    required init(_ session: URLSession = .shared) {
        self.session = session
        mockResult = .failure(.invalidRequest)
    }
    
    func get(_ endpoint: Endpoint, completion: @escaping APICompletion) {
        completion(mockResult)
    }
    
}



// MARK: - Mock ViewController
/// Created for testing of Coordinator's protocol default implementation in extension.

/*
class MockViewController: UIViewController {}

class MockModelFactory {
    
    static func create(_ count: Int) -> [Joke] {
        
        return Array(0..<count).map({
            Joke(id: $0, joke: NSUUID().uuidString)
        })
        
    }
    
}*/
