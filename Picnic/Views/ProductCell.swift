//
//  ProductCell.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
	
	static let identifier = String(describing: ProductCell.self)
	
	@IBOutlet var productImage: UIImageView!
	@IBOutlet var productName: UILabel!
	@IBOutlet var productPrice: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		layer.borderWidth = 1
		productImage.layer.borderWidth = 2
		productImage.layer.borderColor = UIColor.green.cgColor
        // Initialization code
    }
	
	func configure(with model: ProductCellModel) {
		productName.text = model.name
		productPrice.text = model.price
	}
}
