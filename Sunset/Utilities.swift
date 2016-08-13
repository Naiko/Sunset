//
//  Utilities.swift
//  Sunset
//
//  Created by Nico on 13/08/2016.
//  Copyright © 2016 Nicolas Robin. All rights reserved.
//

import Foundation

func clamp<T: Comparable>(value: T, lower: T, upper: T) -> T {
	return min(max(value, lower), upper)
}
