//
//  FeedType.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation

enum FeedType: String, Codable {
    case created = "created", started = "started", updated = "updated"
}
