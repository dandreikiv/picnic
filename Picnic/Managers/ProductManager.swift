//
//  ProductManager.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

protocol ProductManagerProtocol {
	
	func retrieveProducts(completion: @escaping ([Product]?, Error?) -> Swift.Void)
	func retrieveDetails(of product: Product, completion: @escaping (ProductDetails?, Error?) -> Swift.Void)
}

class ProductManager: ProductManagerProtocol {
	
	private let requestFactory: RequestFactoryProtocol
	
	init(requestFactory: RequestFactoryProtocol) {
		self.requestFactory = requestFactory
	}
	
	func retrieveProducts(completion: @escaping ([Product]?, Error?) -> Swift.Void ) {
		
		guard let request = requestFactory.productListRequest() else {
			completion([], nil)
			return
		}
		
		NetworkManager.perform(request) { (data, error) in
			
			// Complete the method and pass error to a completion handler,
			// in case the request returned an error.
			guard error == nil else {
				completion(nil, error)
				return
			}
			
			// Return an empty list of products, in case the request
			// returned no data.
			guard let jsonData = data else {
				completion([], nil)
				return
			}
			
			// Return an empty list of products in case of JSON decoding was not successful.
			guard let productList = try? JSONDecoder().decode(ProductList.self, from: jsonData) else {
				completion([], nil)
				return 
			}
			
			completion(productList.products, nil)
		}
	}
	
	func retrieveDetails(of product: Product, completion: @escaping (ProductDetails?, Error?) -> Swift.Void) {
		
		guard let request = requestFactory.detailsRequest(of: product) else {
			completion(nil, nil)
			return
		}
		
		NetworkManager.perform(request) { (data, error) in
			
			// Complete the method and pass an error to a completion handler,
			// in case the request returned an error.
			guard error == nil else {
				completion(nil, error)
				return
			}
			
			// Return nil, in case the request returned neither error nor data.
			// returned no data.
			guard let jsonData = data else {
				completion(nil, nil)
				return
			}
			
			// Return an empty list of products in case of JSON decoding was not successful.
			guard let product = try? JSONDecoder().decode(ProductDetails.self, from: jsonData) else {
				completion(nil, nil)
				return
			}
			
			completion(product, nil)
		}
	}
}
