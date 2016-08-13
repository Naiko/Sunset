//
//  UIColor+GetRGB.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	func getRGB() -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
		let rgba = getRGBA()
		return (red: rgba.red, green: rgba.green, blue: rgba.blue)
	}

	func getRGBA() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		var red: CGFloat = 0.0
		var green: CGFloat = 0.0
		var blue: CGFloat = 0.0
		var alpha: CGFloat = 0.0
		getRed(&red, green: &green, blue: &blue, alpha: &alpha)

		return (red: red, green: green, blue: blue, alpha: alpha)
	}
}
