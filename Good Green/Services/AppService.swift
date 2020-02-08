//
//  App Service.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI

protocol AppService {
    func getChallenge(challengeID: String, callback: (Challenge?) -> Void)
    func getUserChallenges(callback: ())
    func getUser(userID: String, callback: (User?) -> Void)
    func authUser(username: String, password: String, callback: (User?) -> Void)
    func getFeed(offset: Int, callback: ([FeedObject]?) -> Void)
    func getProgress(challengeID: String, userID: String, callback: (Progress?) -> Void)
    func getUsers(query: String, callback: ([User]?) -> Void)
    func createChallenge(name: String, description: String, vibe: Vibe, icon: Image, callback: (Challenge?) -> Void)
    func acceptChallenge(challengeID: String, callback: (Bool) -> Void)
    func dropChallenge(challengeID: String, callback: (Bool) ->  Void)
    func completeChallenge(challengeID: String, callback: (Bool) -> Void)
    func likePost(feedID: String, callback: (Bool) -> Void)
    func unlikePost(feedID: String, callback: (Bool) -> Void)
    func followUser(userID: String, callback: (Bool) -> Void)
    func unfollowUser(userID: String, callback: (Bool) -> Void)
}
