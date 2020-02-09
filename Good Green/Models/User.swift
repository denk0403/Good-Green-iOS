//
//  User.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI

public struct User {
    // the image the user chooses to represent them
    let userImage: String
    // the user's name
    
    let id: String
    
    let name: String
    
    let bio: String
    
    var activeChallenges: [Progress]
    
    var previousChallenges: [Progress]
    
    var followers: [User]
    
    var following: [User]
    
    init(userImage: String, id: String, name: String, bio: String, activeChallenges: [Progress] = [], previousChallenges: [Progress] = [], followers: [User] = [], following: [User] = []) {
        self.userImage = userImage
        self.id = id
        self.name = name
        self.bio = bio
        self.activeChallenges = activeChallenges
        self.previousChallenges = previousChallenges
        self.followers = followers
        self.following = following
    }
    
    mutating func subscribeTo(challenge: Challenge) {
        let newProgress = Progress(value: 0, threshold: 1, challenge: challenge);
        activeChallenges.append(newProgress)
    }
    
    mutating func unsubscribeFrom(challenge: Challenge) {
        let maybeChallenge = activeChallenges.first {
            $0.challenge.id == challenge.id
        }
        
        if let removeChallenge = maybeChallenge {
            previousChallenges.append(removeChallenge)
            activeChallenges = activeChallenges.filter {
                $0.challenge.id != removeChallenge.challenge.id
            }
        }
    }
    
    mutating func addFollowing(user: User) {
        following.append(user)
    }
    
    mutating func addFollower(user: User) {
        followers.append(user)
    }
    
    mutating func removeFollowing(user: User) {
        following = following.filter {
            $0.id != user.id
        }
    }
    
    mutating func removeFollower(user: User) {
        followers = followers.filter {
            $0.id != user.id
        }
    }
    
}

struct UserDTO: Codable {
	// the image the user chooses to represent them
    let userImage: String
    // the user's name
    
    let id: String
    
    let name: String
    
    let bio: String
    
    var activeChallenges: [String]
    
    var previousChallenges: [String]
    
    var following: [String]
	
	enum CodingKeys: String, CodingKey {
		case userImage = "image"
		case id = "username"
		case name
		case bio
		case activeChallenges
		case previousChallenges
		case following
	}
}
