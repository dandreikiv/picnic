//
//  ProductDetailsViewController.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 14/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

	var product: Product?
	var productManager: ProductManagerProtocol?
	
	@IBOutlet var productName: UILabel!
	@IBOutlet var productImage: UIImageView!
	@IBOutlet var productDescription: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		guard let selectedProduct = product else {
			return
		}
		
		productManager?.retrieveDetails(of: selectedProduct, completion: { [weak self] (details, error) in
			
			guard let productDetails = details else {
				return
			}
			
			DispatchQueue.main.async {
				self?.productName.text = productDetails.name
				self?.productDescription.text = productDetails.description
				
				guard let imageString = productDetails.image, let url = URL(string: imageString) else {
					return
				}
				
				self?.productImage.load(image: url)
			}
		})
    }
}
