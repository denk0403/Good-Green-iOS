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
    func getChallenge(challengeID: String, callback: @escaping (Challenge?) -> Void)
    func getUserActiveChallenges(callback: @escaping ([Progress]?) -> Void )
	func getUserPreviousChallenges(callback: @escaping ([Progress]?) -> Void)
    func getUser(userID: String, callback: @escaping (User?) -> Void)
    func authUser(username: String, password: String, callback: @escaping (User?) -> Void)
    func getFeed(offset: Int, callback: @escaping ([FeedObject]?) -> Void)
    func getProgress(challengeID: String, userID: String, callback: @escaping (Progress?) -> Void)
    func getUsers(query: String, callback: @escaping ([User]?) -> Void)
    func createChallenge(name: String, description: String, vibe: Vibe, icon: Image, callback: @escaping (Challenge?) -> Void)
    func acceptChallenge(challengeID: String, callback: @escaping (Bool) -> Void)
    func dropChallenge(challengeID: String, callback: @escaping (Bool) ->  Void)
    func completeChallenge(challengeID: String, callback: @escaping (Bool) -> Void)
    func likePost(feedID: String, callback: @escaping (Bool) -> Void)
    func unlikePost(feedID: String, callback: @escaping (Bool) -> Void)
    func followUser(userID: String, callback: @escaping (Bool) -> Void)
    func unfollowUser(userID: String, callback: @escaping (Bool) -> Void)
    func searchChallenges(query: String, callback: @escaping ([Challenge]?) -> Void)
}
