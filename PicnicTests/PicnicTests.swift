//
//  PicnicTests.swift
//  PicnicTests
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import XCTest
@testable import Picnic

class PicnicTests: XCTestCase {
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testLocalJsonUrlBuilderReturnsUrlForProductListJson() {
		let urlBuilder = LocalJSONUrlBuilder()
		let url = urlBuilder.productListUrl()
		XCTAssertNotNil(url)
	}
	
	func testLocalJsonUrlBuilderReturnsUrlForProductDetails() {
		let product = Product(productId: "1", name: "Pork", price: 100, image: nil)
		
		let urlBuilder = LocalJSONUrlBuilder()
		let url = urlBuilder.detailsUrl(forProduct: product.productId)
		XCTAssertNotNil(url)
	}
	
    func testRequestFactoryReturnsNonNillProductListUrl() {
		let requestFactory = RequestFactory(urlBuilder: UrlBuilder())
		let url = requestFactory.productListRequest()
		XCTAssertNotNil(url)
    }
	
	func testRequestFactoryReturnsNonNillProductDetailsUrl() {
		
		let product = Product(productId: "1", name: "Pork", price: 100, image: nil)
		
		let requestFactory = RequestFactory(urlBuilder: UrlBuilder())
		let url = requestFactory.detailsRequest(of: product)
		XCTAssertNotNil(url)
	}
}
