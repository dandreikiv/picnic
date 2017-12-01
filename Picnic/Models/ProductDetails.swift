//
//  ProductDetails.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

struct ProductDetails: Decodable {
	let productId: String
	let name: String
	let price: Int
	let image: String?
	let description: String?
	
	enum CodingKeys : String, CodingKey {
		case productId = "product_id"
		case name
		case price
		case image
		case description
	}
}
