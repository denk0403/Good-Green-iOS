//
//  Challenge.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI

public struct Challenge {
    
    let id: String
    
    let name: String
    
    let iconImage: Image
    
    let vibe: Vibe
    
    let description: String
    
    let threshold: Int
    
    let creator: User
    
    var challengeUsers: [User]
    
    init(id: String, name: String, iconImage: Image, vibe: Vibe, description: String, threshold: Int, creator: User, challengeUsers: [User] = []) {
        self.id = id
        self.name = name
        self.iconImage = iconImage
        self.vibe = vibe
        self.description = description
        self.threshold = threshold
        self.creator = creator
        self.challengeUsers = challengeUsers
        
    }
    
    mutating func subscribeUser(user: User) {
        self.challengeUsers.append(user)
    }
    
    mutating func unsubscribeUser(user: User) {
        self.challengeUsers = self.challengeUsers.filter {
            $0.id != user.id
        }
    }
    
    mutating func subscribeUsers(users: [User]) {
        self.challengeUsers.append(contentsOf: users)
    }
    
    mutating func unsubscribeUser(users: [User]) throws {
        self.challengeUsers = try self.challengeUsers.filter {
            (user: User) throws -> Bool in
            !users.contains {
                user.id != $0.id
            }
        }
    }
}

struct ChallengeDTO: Codable {
	let id: String
    
    let name: String
    
    let iconImage: String
    
    let vibe: Vibe
    
    let description: String
    
    let threshold: Int
    
    let creator: String
    
    var challengeUsers: [String]
	
	enum CodingKeys: String, CodingKey {
		case id = "uuid"
		case name = "id"
		case iconImage = "icon"
		case vibe
		case description
		case threshold
		case challengeUsers = "users"
        case creator
	}
}
