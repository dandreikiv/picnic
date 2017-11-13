//
//  UIImageViewExtension.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 14/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit.UIImageView
import UIKit.UIImage

extension UIImageView {
	
	func load(image url: URL) {
		image = nil
		let request = URLRequest(url: url)
		
		if let response = URLCache.shared.cachedResponse(for: request) {
			self.image = UIImage(data: response.data)
			return
		}
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			guard let data = data, let response = response else {
				return
			}

			let cachedResponse = CachedURLResponse(response: response, data: data)
			URLCache.shared.storeCachedResponse(cachedResponse, for: request)

			DispatchQueue.main.async {
				self.image = UIImage(data: data)
			}
		}.resume()
	}
}
