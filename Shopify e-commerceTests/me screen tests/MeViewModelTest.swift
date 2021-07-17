//
//  MeViewModelTest.swift
//  Shopify e-commerceTests
//
//  Created by Amr Muhammad on 6/19/21.
//  
//

import XCTest
@testable import ShopMe
class MeViewModelTest: XCTestCase {
    var meViewModel:MeViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        meViewModel = MeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        meViewModel = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testValidation() throws {
        
        XCTAssertTrue(meViewModel.emailRegexCheck(text: "ayman@yahoo.com"))
        XCTAssertFalse(meViewModel.emailRegexCheck(text: "ayman"))
        
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

