//
//  ProductCellModel.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

struct ProductCellModel {
	
	private let product: Product
	private let numberFormatter: NumberFormatter
	
	var name: String {
		return product.name
	}
	
	var price: String? {
		let productPrice = Double(product.price) / 100.0
		return numberFormatter.string(from: NSNumber(floatLiteral: productPrice))
	}
	
	var imageUrl: URL? {
		guard let url = product.image else {
			return nil
		}
		return URL(string: url)
	}
	
	init(product: Product) {
		self.product = product
		numberFormatter = NumberFormatter()
		numberFormatter.currencySymbol = "€"
		numberFormatter.minimumIntegerDigits = 1
		numberFormatter.minimumFractionDigits = 2
		numberFormatter.maximumFractionDigits = 2
		numberFormatter.numberStyle = .currency
	}
	
	static func model(for product: Product) -> ProductCellModel {
		return ProductCellModel(product: product)
	}
}

