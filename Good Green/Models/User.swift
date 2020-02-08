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
    let userImage: Image
    // the user's name
    
    let id: String
    
    let name: String
    
    let bio: String
    
    var activeChallenges: [Progress]
    
    var previousChallenges: [Progress]
    
    let followers: [User]
    
    let following: [User]
    
    init(userImage: Image, id: String, name: String, bio: String, activeChallenges: [Progress] = [], previousChallenges: [Progress] = [], followers: [User] = [], following: [User] = []) {
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
        let newProgress = Progress(value: 0, challenge: challenge);
        activeChallenges.append(newProgress);
    }
    
}
