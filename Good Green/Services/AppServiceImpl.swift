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
    
    var userID: String?;
    
    init() {
        Constants.challenge1.subscribeUsers(users: [user1])
        Constants.challenge2.subscribeUsers(users: [user3])
        Constants.challenge3.subscribeUsers(users: [user1, user2])
        Constants.challenge4.subscribeUsers(users: [user1, user2, user4])
    }
    
    func getChallenge(challengeID: String, callback: (Challenge?) -> Void) {
        callback(Challenge(id: "1", name: "Plant a Tree", iconImage: Image(systemName: "house"), vibe: .trees, description: "Plant a tree to help combat deforestation"))
    }
    
}
