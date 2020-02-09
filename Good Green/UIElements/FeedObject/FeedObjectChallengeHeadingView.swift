//
//  FeedObjectChallengeHeadingView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedObjectChallengeHeadingView: View {
    
     let feedObject: FeedObject
    
    var body: some View {
        HStack {
            Image(systemName: feedObject.user.userImage)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color(Constants.gunmetal), lineWidth: 1))
                .scaledToFit()
            Text(feedObject.challenge.name)
                .font(.custom("Helvetica Neue", size: 18))
                .foregroundColor(Color(Constants.gunmetal))
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
        }
    }
}

struct FeedObjectChallengeHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        FeedObjectChallengeHeadingView(feedObject: Constants.fo1)
    }
}
