//
//  uMotifProjectTests.swift
//  uMotifProjectTests
//
//   Created by Melvin Wijenayaka on 14/10/2020.
//

import XCTest
@testable import uMotifProject

class ClientTests: XCTestCase {
    
    var sutClient: JokesClient!
    private let defaultTimeout = 5.0

    override func setUpWithError() throws {
        sutClient = JokesClient(.init(configuration: .ephemeral))
    }

    override func tearDownWithError() throws {
        sutClient = nil
    }

    func test_ValidAPIConnection() throws {

        let random = JokesRequest.random(explictJokes: .include)
        let promise = expectation(description: "Valid API Connection")
        
        sutClient.get(random) { _ in
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: defaultTimeout)
    }

    func test_ReceivedDataFromServer() throws {
        
        let random = JokesRequest.random(explictJokes: .include)
        let promise = expectation(description: "Received Data from API")
        var connectionResult: Result<Data, APIError>?
        
        sutClient.get(random) { result in
            connectionResult = result
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: defaultTimeout)
        
        guard let actualResult = connectionResult else { return XCTFail() }
        
        switch actualResult {
            case .success(_): break
            case .failure(let error): XCTFail(error.localizedDescription)
        }
        
    }
    
    func test_InvalidRequest_Fails() {
        
        let mockRequest = MockRequest()
        mockRequest.state = .invalid
        
        let promise = expectation(description: "Received Data from API")
        var connectionResult: Result<Data, APIError>?
        
        sutClient.get(mockRequest) { result in
            connectionResult = result
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: defaultTimeout)
        
        guard let actualResult = connectionResult else { return XCTFail() }
        
        switch actualResult {
            case .success(_): XCTFail()
            case .failure(_): break
        }
        
    }

}
