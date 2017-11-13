//
//  LocalJSONUrlBuilder.swift
//  PicnicTests
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

struct LocalJSONUrlBuilder: UrlBuilderProtocol {
	
	private let bundle: Bundle?
	
	init() {
		bundle = Bundle(for: ProductManager.self)
	}
	
	func productListUrl() -> URL? {
		guard let path = bundle?.path(forResource: "Products", ofType: "json") else {
			return nil
		}
		return URL(fileURLWithPath: path)
	}
	
	func detailsUrl(forProduct productId: String) -> URL? {
		guard let path = bundle?.path(forResource: "ProductDetails", ofType: "json") else {
			return nil
		}
		return URL(fileURLWithPath: path)
	}
}
