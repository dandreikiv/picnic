//
//  Product.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

struct Product: Decodable {
	var productId: String
	var name: String
	var price: Int
	var image: String?
	
	enum CodingKeys : String, CodingKey {
		case productId = "product_id"
		case name
		case price
		case image
	}
}
