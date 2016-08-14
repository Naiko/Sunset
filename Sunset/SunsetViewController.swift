//
//  SunsetViewController.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import UIKit

final class SunsetViewController: UIViewController {

	let sunsetSimulator = SunsetSimulator(startColor: UIColor(temperature: 5000),
	                                      endColor: UIColor(temperature: 1850),
	                                      startBrightness: 1.0,
	                                      endBrightness: 0.0,
	                                      duration: 15 * 60)

	private let screen = UIScreen.main

	private var savedScreenBrightness: CGFloat?

	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		sunsetSimulator.changeHandler = { [weak self] light in
			guard let `self` = self else { return }

			self.view.backgroundColor = light.color
			self.screen.brightness = light.brightness
		}
		saveScreenBrightness()
		sunsetSimulator.startSunset()
	}

	override func viewDidAppear(_ animated: Bool) {
		NotificationCenter.default.addObserver(self, selector: #selector(resetScreenBrightness), name: Notification.Name.UIApplicationWillResignActive, object: nil)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)

		NotificationCenter.default.removeObserver(self)
		resetScreenBrightness()
	}

	@IBAction func closeButtonTapped() {
		dismiss(animated: true, completion: nil)
	}

	// MARK: - Screen brightness
	private func saveScreenBrightness() {
		savedScreenBrightness = screen.brightness
	}

	@objc private func resetScreenBrightness() {
		guard let savedScreenBrightness = savedScreenBrightness else { return }

		screen.brightness = savedScreenBrightness
		self.savedScreenBrightness = nil
	}
}

