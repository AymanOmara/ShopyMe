//
//  shopProduct.swift
//  Shopify e-commerceTests
//
//  Created by marwa on 6/18/21.
// 
//

import XCTest
@testable import ShopMe
class shopProduct: XCTestCase {
    var allProduct : AllProduct!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        allProduct = AllProduct(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        allProduct = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testGetAllProduct(){
        allProduct.fetchProductData { (product, error) in
            if let error = error{
                XCTFail()
            }else{
                XCTAssertEqual(product?.count, 2)
            }
        }

        }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
