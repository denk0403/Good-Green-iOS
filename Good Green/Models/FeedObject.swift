//
//  FeedObject.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation


public struct FeedObject {
    
    let id: Int
    
    let user: User
    
    let challenge: Challenge
    
    let likes: [User]
    
    let feedType: FeedType

}
