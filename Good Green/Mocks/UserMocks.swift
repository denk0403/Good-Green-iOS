//
//  UserMocks.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI

let user1 = User(userImage: Image(systemName: "person.fill"), id: "1", name: "Dennis Kats", bio: "single ready to mingle", activeChallenges: [], previousChallenges: [], followers: [], following: [])
let user2 = User(userImage: Image(systemName: "person.fill"), id: "2", name: "Levi Kaplan", bio: "graphic design god", activeChallenges: [], previousChallenges: [], followers: [user1], following: [user1])
let user3 = User(userImage: Image(systemName: "person.fill"), id: "3", name: "Andrew Johnson", bio: "Spring Booter", activeChallenges: [], previousChallenges: [], followers: [user1], following: [user2, user1])
let user4 = User(userImage: Image(systemName: "person.fill"), id: "4", name: "Jack Rosen", bio: "Lexi fan", activeChallenges: [], previousChallenges: [], followers: [user2], following: [user3])
