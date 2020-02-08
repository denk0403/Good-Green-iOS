//
//  FeedObjectMocks.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation

extension Constants {
    static var fo1 = FeedObject(id: "1", user: Constants.user1, challenge: Constants.challenge1, likes: [Constants.user2, Constants.user3], feedType: .created, date: Date())
    static var fo2 = FeedObject(id: "2", user: Constants.user2, challenge: Constants.challenge2, likes: [Constants.user1, Constants.user3], feedType: .started, date: Date())
    static var fo3 = FeedObject(id: "3", user: Constants.user3, challenge: Constants.challenge4, likes: [Constants.user4, Constants.user2], feedType: .updated, date: Date())
}
