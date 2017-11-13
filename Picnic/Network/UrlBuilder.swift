//
//  UrlBuilder.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

protocol UrlBuilderProtocol {
	func productListUrl() -> URL?
	func detailsUrl(forProduct productId: String) -> URL?
}

struct UrlBuilder: UrlBuilderProtocol {
	func productListUrl() -> URL? {
		return URL(string: "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart/list")
	}
	
	func detailsUrl(forProduct productId: String) -> URL? {
		let urlString = "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart/\(productId)/detail"
		return URL(string: urlString)
	}
}
