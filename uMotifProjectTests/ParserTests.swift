//
//  uMotifProjectTests.swift
//  uMotifProjectTests
//
//   Created by Melvin Wijenayaka on 14/10/2020.
//

import XCTest
@testable import uMotifProject

class ParserTests: XCTestCase {
    
    var testBundle: Bundle!

    override func setUpWithError() throws {
        testBundle = Bundle(for: type(of: self))
    }

    override func tearDownWithError() throws {
        testBundle = nil
    }

    func test_EmptyData_ParserThrowsException() {
        
        // Given empty data
        let emptyData = Data()
        
        // When we parse, an exception should be thrown
        XCTAssertThrowsError(try JSONParser.parse(emptyData, type: JokeRoot.self))
        
    }
    
    func test_InavlidData_ParserThrowsException() {
        
        let invalidData = "Hello, world".data(using: .utf8)!
        
        XCTAssertThrowsError(try JSONParser.parse(invalidData, type: JokeRoot.self))
    }
    
    func test_SampleData_ParserNoThrow() {
        
        let sampleDataPath = testBundle.path(forResource: "sampleResponse", ofType: "json")!
        let simpleData = try! Data(contentsOf: URL(fileURLWithPath: sampleDataPath))
        
        XCTAssertNoThrow(try JSONParser.parse(simpleData, type: JokeRoot.self))
    }
    
    func test_SampleData_ParsedHasResults() {
        
        let sampleDataPath = testBundle.path(forResource: "sampleResponse", ofType: "json")!
        let simpleData = try! Data(contentsOf: URL(fileURLWithPath: sampleDataPath))
        let result = try! JSONParser.parse(simpleData, type: JokeRoot.self)
        
        let count = result.value.count
        
        XCTAssertGreaterThanOrEqual(count, 1)
    }

}
