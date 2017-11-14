//
//  AppDelegate.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 13/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		configureImageCache()
		
		return true
	}
	
	private func configureImageCache() {
		let momoryCapacity: Int = 1024 * 1024 * 100
		let diskCapacity: Int = 1024 * 1024 * 100
		URLCache.shared = URLCache(memoryCapacity: momoryCapacity, diskCapacity: diskCapacity, diskPath: "cachepath")
	}
}

