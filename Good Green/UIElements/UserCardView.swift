//
//  UserCardView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct UserCardView: View {
    
    let user: User
    
    let cornerR: CGFloat = 12
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                .fill(Color(Constants.mint))
                .frame(width: 319, height: 32.34)
               .overlay(
                   RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                    .stroke(Color(Constants.gunmetal), lineWidth: 1))
            Button(action: {
                
            }) {
                HStack {
                    user.userImage
                    .overlay(
                        Circle().stroke(Color(Constants.gunmetal), lineWidth: 1)
                            .frame(width: 20, height: 20)
                    )
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    Text(user.name)
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(Color(Constants.gunmetal))
                    Spacer()
                }
            }
            .frame(width: 319, height: 32.34)
        }
    }
}

struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
//        let user = User(userImage: Image(systemName: "house"), id: "1", name: "Levi", bio: "hello", activeChallenges: [], previousChallenges: [], followers: [], following: [])
//
//        let challenge = Challenge(id: "2", name: "challenge 1", iconImage:Image(systemName: "house"), vibe: Vibe.water, description: "Grab a shovel and get digging! You can find saplings at hardware stores or anywhere that sells trees. Make it a goal to plant one every month and soon you’ll have a whole grove!", threshold: 1, challengeUsers: [])
//        let feedObject2 = FeedObject(id: "3", user: user, challenge: challenge, likes: [], feedType: FeedType.created, date: Date())
        return UserCardView(user: Constants.user1)
    }
}
