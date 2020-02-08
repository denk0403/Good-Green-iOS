//
//  Utils.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation

struct Utils {
    
    static func pair(user: inout User, challenge: inout Challenge) {
        challenge.subscribeUser(user: user)
        user.subscribeTo(challenge: challenge)
    }

    static func unpair(user: inout User, challenge: inout Challenge) {
        challenge.unsubscribeUser(user: user);
        user.unsubscribeFrom(challenge: challenge);
    }

    static func follow(follower: inout User, following: inout User) {
        follower.addFollowing(user: following)
        following.addFollower(user: follower)
    }

    static func unfollow(unfollower: inout User, unfollowing: inout User) {
        unfollower.removeFollowing(user: unfollowing)
        unfollowing.removeFollower(user: unfollower)
    }
    
}


