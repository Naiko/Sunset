//
//  SunsetSimulator.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import Foundation
import UIKit

final class SunsetSimulator {

	private var sun: Sun

	private let refreshInterval: TimeInterval = 1.0/60.0 // 60 times per sec

	private let startColor: UIColor
	private let endColor: UIColor
	private let duration: TimeInterval

	private var timer: Timer?
	private var startDate: Date?

	var changeHandler: ((sun: Sun) -> ())?

	init(startColor: UIColor, endColor: UIColor, duration: TimeInterval) {
		self.sun = Sun(color: .white, intensity: 1.0)
		self.startColor = startColor
		self.endColor = endColor
		self.duration = duration
	}

	func startSunset() {
		startDate = Date()
		timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
	}

	@objc private func timerTick() {
		guard let startDate = startDate else { return }

		let elapsedTime = Date().timeIntervalSince(startDate)

		guard elapsedTime < duration else {
			timer?.invalidate()
			timer = nil
			return
		}

		let progress = CGFloat(elapsedTime/duration)

		let (startRed, startGreen, startBlue) = startColor.getRGB()
		let (endRed, endGreen, endBlue) = endColor.getRGB()

		let currentColorComponents = [(startRed, endRed), (startGreen, endGreen), (startBlue, endBlue)].map { (start, end) in
			return start + progress * (end - start)
		}

		sun.color = UIColor(red: currentColorComponents[0], green: currentColorComponents[1], blue: currentColorComponents[2], alpha: 1.0)

		changeHandler?(sun: self.sun)
	}
}
