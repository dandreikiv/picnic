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
		productImage.layer.borderWidth = 1
		productImage.layer.borderColor = UIColor(white: 0.2, alpha: 0.4).cgColor
        // Initialization code
    }
	
	func configure(with model: ProductCellModel) {
		productName.text = model.name
		productPrice.text = model.price
		
		if let imageUrl = model.imageUrl {
			productImage.load(image: imageUrl)
		}
	}
}
