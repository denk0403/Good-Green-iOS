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
    
    var challengeUsers: [User]
    
    init(id: String, name: String, iconImage: Image, vibe: Vibe, description: String, challengeUsers: [User] = []) {
        self.id = id
        self.name = name
        self.iconImage = iconImage
        self.vibe = vibe
        self.description = description
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
