//
//  ProductsViewController.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ProductsViewController: UICollectionViewController {
	
	private lazy var productManger: ProductManagerProtocol = {
		let requestFactory = RequestFactory(urlBuilder: LocalJSONUrlBuilder())
		return ProductManager(requestFactory: requestFactory)
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		productManger.retrieveProducts { (products, error) in
			guard error == nil else {
				print(error ?? "Error")
				return
			}
			guard let products = products else {
				return
			}
			print(products)
		}
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

