//
//  AppServiceImpl.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI

class AppServiceImpl: AppService {
    
    let currentUser: User? = Constants.user1
    
    var userID: String?;
    
    init() {
        Utils.pair(user: &Constants.user1, challenge: &Constants.challenge1)
        Utils.pair(user: &Constants.user3, challenge: &Constants.challenge2)
        Utils.pair(user: &Constants.user1, challenge: &Constants.challenge3)
        Utils.pair(user: &Constants.user2, challenge: &Constants.challenge3)
        Utils.pair(user: &Constants.user1, challenge: &Constants.challenge4)
        Utils.pair(user: &Constants.user1, challenge: &Constants.challenge4)
        Utils.pair(user: &Constants.user4, challenge: &Constants.challenge4)
        Utils.follow(follower: &Constants.user1, following: &Constants.user2)
        Utils.follow(follower: &Constants.user2, following: &Constants.user1)
        Utils.follow(follower: &Constants.user1, following: &Constants.user3)
        Utils.follow(follower: &Constants.user2, following: &Constants.user3)
        Utils.follow(follower: &Constants.user2, following: &Constants.user4)
        Utils.follow(follower: &Constants.user4, following: &Constants.user3)
    }
    
    func getChallenge(challengeID: String, callback: @escaping (Challenge?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            callback(Constants.challenge1)
        }
    }
    
    func getUserChallenges(callback: @escaping ([Progress]?) -> Void) {
        callback([Constants.progress1, Constants.progress2, Constants.progress3])
    }
	func getUserActiveChallenges(callback: @escaping ([Progress]?) -> Void ) {
		self.getUserChallenges(callback: callback)
	}
	func getUserPreviousChallenges(callback: @escaping ([Progress]?) -> Void) {
		self.getUserChallenges(callback: callback)
	}
    
    func getUser(userID: String, callback: @escaping (User?) -> Void) {
        callback(Constants.user1)
    }
    
    func authUser(username: String, password: String, callback: @escaping (User?) -> Void) {
        callback(Constants.user2)
    }
    
    func getFeed(offset: Int, callback: @escaping ([FeedObject]?) -> Void) {
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			callback([Constants.fo1, Constants.fo2])
		}
    }
    
    func getProgress(challengeID: String, userID: String, callback: @escaping (Progress?) -> Void) {
        callback(Constants.progress2)
    }
    
    func getUsers(query: String, callback: @escaping ([User]?) -> Void) {
        callback([Constants.user1, Constants.user3])
    }
    
    func createChallenge(name: String, description: String, vibe: Vibe, icon: Image, callback: @escaping (Challenge?) -> Void) {
        callback(Constants.challenge4)
    }
    
    func acceptChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
        callback(true)
    }
    
    func dropChallenge(challengeID: String, callback: @escaping (Bool) ->  Void) {
        callback(true)
    }
    
    func completeChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
        callback(true)
    }
    
    func likePost(feedID: String, callback: @escaping (Bool) -> Void) {
        callback(true)
    }
    
    func unlikePost(feedID: String, callback: @escaping (Bool) -> Void) {
        callback(true)
    }
    
    func followUser(userID: String, callback: @escaping (Bool) -> Void) {
        callback(true)
    }
    
    func unfollowUser(userID: String, callback: @escaping (Bool) -> Void) {
        callback(true)
    }
    
    func searchChallenges(query: String, callback: @escaping ([Challenge]?) -> Void) {
        callback([Constants.challenge1, Constants.challenge2, Constants.challenge3])
    }
	
	func createUser(username: String, password: String, callback: @escaping (User?) -> ()) {
		callback(Constants.user2)
	}
	func getUserFeed(userID: String, callback: @escaping ([FeedObject]?) -> ()) {
		callback([Constants.fo1, Constants.fo3])
	}
    
}
