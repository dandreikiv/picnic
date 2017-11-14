//
//  ProductNavigationController.swift
//  Picnic
//
//  Created by dmytro.andreikiv@philips.com on 14/11/2017.
//  Copyright © 2017 Dmytro Andreikiv. All rights reserved.
//

import UIKit

class ProductNavigationController: UINavigationController {
	
	override var shouldAutorotate: Bool {
		if let shouldRotate = self.topViewController?.shouldAutorotate {
			return shouldRotate
		}
		return super.shouldAutorotate
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		if let orientation = self.topViewController?.supportedInterfaceOrientations {
			return orientation
		}
		return super.supportedInterfaceOrientations
	}
	
	override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
		if let orientation = self.topViewController?.preferredInterfaceOrientationForPresentation {
			return orientation
		}
		return super.preferredInterfaceOrientationForPresentation
	}
}
