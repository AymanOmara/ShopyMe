//
//  ProductDetailsVMTests.swift
//  Shopify e-commerceTests
//
//  Created by Ahmd Amr on 19/06/2021.
//  
//

import XCTest
@testable import ShopMe

class ProductDetailsVMTests: XCTestCase {

    var productDetailsViewModel: ProductDetailsViewModelType!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productDetailsViewModel = ProductDetailsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        productDetailsViewModel.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
