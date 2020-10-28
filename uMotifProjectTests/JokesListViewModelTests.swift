//
//  uMotifProjectTests.swift
//  uMotifProjectTests
//
//   Created by Melvin Wijenayaka on 14/10/2020.
//

import XCTest

@testable import uMotifProject

class ViewModelTests: XCTestCase {
    
    var sut: JokesViewModel!
    var mockJokesClient: MockJokesClient!
    
    override func setUpWithError() throws {
        mockJokesClient = MockJokesClient()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockJokesClient = nil
    }
    
    func test_EmptyViewModel_HasNoSections() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let result = sut.numberOfSections
        
        // Then
        XCTAssertEqual(result, 0)
        
    }
    
    func test_EmptyViewModel_HasNoRowsInFirstSection() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let result = sut.numberOfObjects(inSection: 0)
        
        // Then
        XCTAssertEqual(result, 0)
        
    }
    
    func test_EmptyViewModel_HasNoRowsInNegativeSection() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let result = sut.numberOfObjects(inSection: -1)
        
        // Then
        XCTAssertEqual(result, 0)
        
    }
    
    func test_EmptyViewModel_HasNoRowsInMaxSection() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let result = sut.numberOfObjects(inSection: Int.max)
        
        // Then
        XCTAssertEqual(result, 0)
        
    }
    
    func test_EmptyViewModel_HasNoObjectForFirstIndexPath() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let firstIndexPath = IndexPath(row: 0, section: 0)
        let result = sut.object(at: firstIndexPath)
        
        // Then
        XCTAssertNil(result)
        
    }
    
    func test_EmptyViewModel_HasNoObjectForNegativeIndexPath() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let negativeIndexPath = IndexPath(row: -1, section: -1)
        let result = sut.object(at: negativeIndexPath)
        
        // Then
        XCTAssertNil(result)
        
    }
    
    func test_EmptyViewModel_HasNoObjectForMaxIndexPath() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let maxIndexPath = IndexPath(row: Int.max, section: Int.max)
        let result = sut.object(at: maxIndexPath)
        
        // Then
        XCTAssertNil(result)
        
    }
    
    
    func test_EmptyViewModel_ShouldNotPrefetchGivenEmptyItems() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let result = sut.shouldPrefetch(given: [])
        
        // Then
        XCTAssertFalse(result)
        
    }
    
    func test_EmptyViewModel_ShouldPrefetchGivenItems() {
        
        // Given
        sut = JokesViewModel(with: [], apiClient: mockJokesClient)
        
        // When
        let paths = Array(0...3).map({ IndexPath(row: $0, section: 0) })
        let result = sut.shouldPrefetch(given: paths)
        
        // Then
        XCTAssertTrue(result)
        
    }
    


}
