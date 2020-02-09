//
//  ProgressMocks.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation

extension Constants {
	static var progress1 = Progress(value: 0, threshold: 1,challenge: Constants.challenge1)
	static var progress2 = Progress(value: 0, threshold: 1, challenge: Constants.challenge2)
	static var progress3 = Progress(value: 1, threshold: 1, challenge: Constants.challenge3)
}
