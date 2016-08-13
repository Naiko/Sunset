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

	private var duration: TimeInterval?
	private var timer: Timer?
	private var startDate: Date?

	var changeHandler: ((sun: Sun) -> ())?

	init() {
		self.sun = Sun(color: .white, intensity: 1.0)
	}

	func startSunset(duration: TimeInterval) {
		self.duration = duration
		startDate = Date()
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
	}

	@objc private func timerTick() {
		guard let duration = duration, let startDate = startDate else { return }

		let elapsedTime = Date().timeIntervalSince(startDate)

		guard elapsedTime < duration else {
			timer?.invalidate()
			timer = nil
			return
		}

		let otherThanRedValue = CGFloat(1 - 2*(elapsedTime * 10.0)/255.0)
		sun.color = UIColor(red: 1.0, green: otherThanRedValue, blue: otherThanRedValue, alpha: 1.0)

		changeHandler?(sun: self.sun)
	}
}
