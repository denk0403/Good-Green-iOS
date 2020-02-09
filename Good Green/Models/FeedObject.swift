//
//  FeedObject.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation


public struct FeedObject {
    
    let id: String
    
    let user: User
    
    let challenge: Challenge
    
    let likes: [User]
    
    let feedType: FeedType
    
    let date: Date

}

struct FeedObjectDTO: Codable {
	let id: String
    
    let creator: String
    
    let challengeId: String
    
    let likes: [String]
    
    let feedType: FeedType?
    
    let date: Date
	
	enum CodingKeys: String, CodingKey {
		case id
		case creator = "user"
		case challengeId = "challenge"
		case likes
		case feedType
		case date
	}
}
