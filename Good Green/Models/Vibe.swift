//
//  Vibe.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation

enum Vibe: String, Codable {
    case water = "Water", trash = "Trash", trees = "Trees", animals = "Animals", transportation = "Transportation", clothing = "clothing"
	
    static let allVibes: [String] = [water.rawValue, trash.rawValue, trees.rawValue, animals.rawValue, transportation.rawValue]
    
	func toString() -> String {
		return self.rawValue
	}
}
