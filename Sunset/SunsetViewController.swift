//
//  SunsetViewController.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import UIKit

final class SunsetViewController: UIViewController {

	let sunsetSimulator = SunsetSimulator(startColor: .white, endColor: .red, duration: 10)

	override func viewDidLoad() {
		super.viewDidLoad()

		sunsetSimulator.changeHandler = { [weak self] sun in
			self?.view.backgroundColor = sun.color
		}
		sunsetSimulator.startSunset()
	}
	
}

