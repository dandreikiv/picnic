//
//  RequestManager.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import Foundation

class RequestManager {
	class func perform(_ request: URLRequest, completion: @escaping (Data?, Error?) -> Swift.Void) {
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			
			guard error != nil else {
				completion(nil, error)
				return
			}
			
			completion(data, error)
			
		}.resume()
	}
}
