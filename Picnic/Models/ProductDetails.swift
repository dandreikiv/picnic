//
//  ProductDetails.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

struct ProductDetails: Decodable {
	var productId: String
	var name: String
	var price: Int
	var image: String?
	var description: String?
}
