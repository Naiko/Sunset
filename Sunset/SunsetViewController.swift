//
//  SunsetViewController.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import UIKit

final class SunViewController: UIViewController {

	let sunsetSimulator = SunsetSimulator()

	override func viewDidLoad() {
		super.viewDidLoad()

		sunsetSimulator.changeHandler = { [weak self] sun in
			self?.view.backgroundColor = sun.color
		}
		sunsetSimulator.startSunset(duration: 10)
	}
	
}

