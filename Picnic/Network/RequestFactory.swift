//
//  RequestFactory.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class RequestFactory {
	
	private let urlBuilder: UrlBuilderProtocol
	
	init(urlBuilder: UrlBuilderProtocol) {
		self.urlBuilder = urlBuilder
	}
	
	func productListRequest() -> URLRequest? {
		guard let url = urlBuilder.productListUrl() else {
			return nil
		}
		
		return URLRequest(url: url)
	}
	
	func detailsRequest(of product: Product) -> URLRequest? {
		guard let url = urlBuilder.detailsUrl(forProduct: product.productId) else {
			return nil
		}
		
		return URLRequest(url: url)
	}
}
