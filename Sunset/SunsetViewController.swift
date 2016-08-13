//
//  SunsetViewController.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import UIKit

final class SunsetViewController: UIViewController {

	let sunsetSimulator = SunsetSimulator(startColor: .white, endColor: .red, startBrightness: 1.0, endBrightness: 0.0, duration: 20)

	override func viewDidLoad() {
		super.viewDidLoad()

		sunsetSimulator.changeHandler = { [weak self] sun in
			self?.view.backgroundColor = sun.color
			UIScreen.main.brightness = sun.brightness
		}
		sunsetSimulator.startSunset()
	}
	
}

