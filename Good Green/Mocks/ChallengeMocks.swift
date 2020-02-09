//
//  ChallengeMocks.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI

extension Constants {
    static var challenge1 = Challenge(id: "1", name: "Plant a Tree", iconImage: Image(systemName: "leaf.arrow.circlepath"), vibe: .trees, description: "Plant a tree to help combat deforestation", threshold: 1)
    static var challenge2 = Challenge(id: "2", name: "Rescue an Animal", iconImage: Image(systemName: "hare"), vibe: .animals, description: "Rescue an unsheltered animal", threshold: 1)
    static var challenge3 = Challenge(id: "3", name: "Speed Shower", iconImage: Image(systemName: "drop.triangle"), vibe: .water, description: "Limit a shower to 10 minutes", threshold: 1)
    static var challenge4 = Challenge(id: "4", name: "Trash Slash", iconImage: Image(systemName: "trash.slash"), vibe: .trash, description: "Limit the trash you produce to only 1 small bag a week", threshold: 1)
}


