//
//  ProductCell.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
	
	@IBOutlet var productImage: UIImageView!
	@IBOutlet var productName: UILabel!
	@IBOutlet var productPrice: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
