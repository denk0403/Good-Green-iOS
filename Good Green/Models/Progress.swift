//
//  Progress.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation

struct Progress {

    let value: Int
	
	let threshold: Int
    
    let challenge: Challenge
}

struct ProgressDTO: Codable {
	let value: Int
	let threshold: Int
	let challenge: String
}
