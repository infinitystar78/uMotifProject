//
//  uMotifProjectTests.swift
//  uMotifProjectTests
//
//  Created by Melvin Wijenayaka on 14/10/2020.
//

import XCTest
@testable import uMotifProject

class uMotifProjectTests: XCTestCase {

    let sb = UIStoryboard(name: "Main", bundle: nil)
    

    func test_loading() {
        super.setUp()
        let sut : ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.titleLabel, "titleLabel")
        XCTAssertNotNil(sut.firstNameTextField, "firstNameTextField")
        XCTAssertNotNil(sut.lastNameTextField, "lastNameTextField")
        XCTAssertNotNil(sut.filterButton, "filterButton")
      
    }
    
    func test_tappingButton(){
        let sut : ViewController = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
        sut.filterButton.sendActions(for: .touchUpInside)
        
        
    }
    
    func test_containerView(){
        let sut : ResultsTableViewController = sb.instantiateViewController(identifier: String(describing:ResultsTableViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.dataSource, "dataSource")
        XCTAssertNotNil(sut.tableView, "delegate")
    }
    
    override class func tearDown() {
    
    }

}
