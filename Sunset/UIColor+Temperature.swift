//
//  UIColor+Temperature.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	// Uses algorithm described here http://www.tannerhelland.com/4435/convert-temperature-rgb-algorithm-code/
	convenience init(temperature: CGFloat) {

		let cappedTemperature = clamp(value: temperature, lower: 1000.0, upper: 40000.0)

		let calcTemperature = cappedTemperature / 100.0

		// Red
		var red: CGFloat
		if calcTemperature <= 66.0 {
			red = 255.0
		} else {
			red = CGFloat(329.698727446 * pow(Double(calcTemperature - 60.0), -0.1332047592))
		}
		red = clamp(value: red / 255.0, lower: 0.0, upper: 1.0)

		// Green
		var green: CGFloat
		if calcTemperature <= 66.0 {
			green = 99.4708025861 * log(calcTemperature) - 161.1195681661
		} else {
			green = CGFloat(288.1221695283 * pow(Double(calcTemperature - 60.0), -0.0755148492))
		}
		green = clamp(value: green / 255.0, lower: 0.0, upper: 1.0)

		// Blue
		var blue: CGFloat
		if calcTemperature >= 66.0 {
			blue = 255.0
		} else if calcTemperature <= 19.0 {
			blue = 0.0
		} else {
			blue = 138.5177312231 * log(calcTemperature - 10.0) - 305.0447927307
		}
		blue = clamp(value: blue / 255.0, lower: 0.0, upper: 1.0)


		self.init(red: red, green: green, blue: blue, alpha: 1.0)
	}
}
