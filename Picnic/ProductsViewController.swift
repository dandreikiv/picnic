//
//  ProductsViewController.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ProductsViewController: UICollectionViewController {
	
	private let productDetailsSegueIdentifier = "showProductDetails"
	
	private lazy var productManger: ProductManagerProtocol = {
		let requestFactory = RequestFactory(urlBuilder: UrlBuilder())
		return ProductManager(requestFactory: requestFactory)
	}()
	
	private var products: [Product]?
	private var selectedProduct: Product?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let nib = UINib(nibName: String(describing: ProductCell.self), bundle: Bundle.main)
		collectionView?.register(nib, forCellWithReuseIdentifier: ProductCell.identifier)
		
		productManger.retrieveProducts { [weak self] (products, error)  in 
			guard error == nil else {
				print(error ?? "Error")
				return
			}
			guard let products = products else {
				return
			}
		
			self?.reloadData(with: products)
		}
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	private func reloadData(with products: [Product]) {
		self.products = products
		DispatchQueue.main.async {
			self.collectionView?.reloadData()
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == productDetailsSegueIdentifier {
			guard let destination = segue.destination as? ProductDetailsViewController else {
				return
			}
			destination.product = selectedProduct
			destination.productManager = productManger
		}
	}
	
	override var shouldAutorotate: Bool {
		return true
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return [UIInterfaceOrientationMask.portrait, UIInterfaceOrientationMask.portraitUpsideDown]
	}
	
	override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
		return UIInterfaceOrientation.portrait
	}
}

// MARK: UICollectionViewDatasource
extension ProductsViewController {
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products?.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath)
	}
}

// MARK: UICollectionViewDatasource
extension ProductsViewController {
	override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
		guard let productCell = cell as? ProductCell else {
			return
		}
		
		guard let product = products?[indexPath.row] else {
			return
		}
		
		productCell.configure(with: ProductCellModel.model(for: product))
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		selectedProduct = products?[indexPath.row]
		performSegue(withIdentifier: productDetailsSegueIdentifier, sender: self)
	}
}

private let itemsInRow: CGFloat = 2
private let cellInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)

extension ProductsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width = view.frame.width - (itemsInRow + 1) * (cellInsets.left)
		let cellWidth = width / itemsInRow
		
		return CGSize(width: cellWidth, height: cellWidth)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return cellInsets
	}
}

