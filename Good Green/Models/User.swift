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
    let name: String
    
    let bio: String
    
    let activeChallenges: [Challenge]
    
    let previousChallenges: [Challenge]
    
    let followers: [User]
    
    let following: [User]
    
}
