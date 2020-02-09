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
    
    var currentUser: User? = Constants.user1
    var user: User;
    
    var userID: String?;
    
    var iTC = [
        "1" : Constants.challenge1,
        "2" : Constants.challenge2,
        "3" : Constants.challenge3,
        "4" : Constants.challenge4
    ]
    
    var iTU = [
        "1" : Constants.user1,
        "2" : Constants.user2,
        "3" : Constants.user3,
        "4" : Constants.user4
    ]
    
    var iTF = [
        "1" : Constants.fo1,
        "2" : Constants.fo2,
        "3" : Constants.fo3
    ]
    
    init() {
        user = currentUser!
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(self.iTC[challengeID])
        }
    }
    
    func getUserChallenges(callback: @escaping ([Progress]?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(self.user.activeChallenges)
        }
    }
	func getUserActiveChallenges(callback: @escaping ([Progress]?) -> Void ) {
		self.getUserChallenges(callback: callback)
	}
	func getUserPreviousChallenges(callback: @escaping ([Progress]?) -> Void) {
		self.getUserChallenges(callback: callback)
	}
    
    func getUser(userID: String, callback: @escaping (User?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(self.iTU[userID])
        }
    }
    
    func authUser(username: String, password: String, callback: @escaping (User?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(self.user)
        }
    }
    
    func getFeed(offset: Int, callback: @escaping ([FeedObject]?) -> Void) {
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			callback([Constants.fo1, Constants.fo2])
		}
    }
    
    func getProgress(challengeID: String, userID: String, callback: @escaping (Progress?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(Progress(value: 0, threshold: 1, challenge: self.iTC[challengeID]!))
        }
    }
    
    func getUsers(query: String, callback: @escaping ([User]?) -> Void) {
        let users: [User] = iTU.values.filter({ user in
            user.name.lowercased().contains(query.lowercased())
        })
        print(users)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(users)
        }
    }
    
    func createChallenge(name: String, description: String, vibe: Vibe, icon: Image, callback: @escaping (Challenge?) -> Void) {
        let challenge = Challenge(id: name, name: name, iconImage: icon, vibe: vibe, description: description, threshold: 1, creator: user)
        iTC[name] = challenge;
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(challenge)
        }
    }
    
    func acceptChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
        Utils.pair(user: &self.user, challenge: &(iTC[challengeID]!))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func dropChallenge(challengeID: String, callback: @escaping (Bool) ->  Void) {
        Utils.unpair(user: &self.user, challenge: &(iTC[challengeID]!))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func completeChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func likePost(feedID: String, callback: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func unlikePost(feedID: String, callback: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func followUser(userID: String, callback: @escaping (Bool) -> Void) {
        Utils.follow(follower: &user, following: &(iTU[userID]!))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func unfollowUser(userID: String, callback: @escaping (Bool) -> Void) {
        Utils.unfollow(unfollower: &user, unfollowing: &(iTU[userID]!))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(true)
        }
    }
    
    func searchChallenges(query: String, callback: @escaping ([Challenge]?) -> Void) {
        let challenges: [Challenge] = iTC.values.filter({ challenge in
            challenge.name.lowercased().contains(query.lowercased())
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            callback(challenges)
        }
    }
	
	func createUser(username: String, password: String, callback: @escaping (User?) -> ()) {
		callback(Constants.user2)
	}
	func getUserFeed(userID: String, callback: @escaping ([FeedObject]?) -> ()) {
		callback([Constants.fo1, Constants.fo3])
	}
    
}
