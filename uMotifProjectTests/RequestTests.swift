//
//  uMotifProjectTests.swift
//  uMotifProjectTests
//
//   Created by Melvin Wijenayaka on 14/10/2020.
//

import XCTest
@testable import uMotifProject

class RequestTests: XCTestCase {
    
    func test_RandomJokes_IncludingExplict_HasCorrectBaseURL() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .include)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutBaseURL = components.host
        XCTAssertEqual(sutBaseURL, expectedComponents.host)
        
    }
    
    func test_RandomJokes_IncludingExplict_HasCorrectPath() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .include)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutPath = components.path
        XCTAssertEqual(sutPath, expectedComponents.path)
        
    }
    
    func test_RandomJokes_IncludingExplict_HasCorrectScheme() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .include)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutScheme = components.scheme
        XCTAssertEqual(sutScheme, expectedComponents.scheme)
        
    }
    
    func test_RandomJokes_IncludingExplict_HasCorrectQueryItems() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .include)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutScheme = components.queryItems
        XCTAssertEqual(sutScheme, expectedComponents.queryItems)
        
    }
    
    func test_RandomJokes_ExcludingExplict_HasCorrectBaseURL() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15?exclude=%5Bexplicit%5D")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .exclude)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutBaseURL = components.host
        XCTAssertEqual(sutBaseURL, expectedComponents.host)
        
    }
    
    func test_RandomJokes_ExcludingExplict_HasCorrectPath() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15?exclude=%5Bexplicit%5D")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .exclude)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutPath = components.path
        XCTAssertEqual(sutPath, expectedComponents.path)
        
    }
    
    func test_RandomJokes_ExcludingExplict_HasCorrectScheme() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15?exclude=%5Bexplicit%5D")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .exclude)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutScheme = components.scheme
        XCTAssertEqual(sutScheme, expectedComponents.scheme)
        
    }
    
    func test_RandomJokes_ExcludingExplict_HasCorrectQueryItems() {
        
        // Given
        let expectedComponents = URLComponents(string: "https://api.icndb.com/jokes/random/15?exclude=%5Bexplicit%5D")!
        
        // When
        let sutRequest = JokesRequest.random(explictJokes: .exclude)
        let components = URLComponents(url: (sutRequest.request?.url!)!, resolvingAgainstBaseURL: false)!
        
        // Then
        let sutScheme = components.queryItems
        XCTAssertEqual(sutScheme, expectedComponents.queryItems)
        
    }
}
