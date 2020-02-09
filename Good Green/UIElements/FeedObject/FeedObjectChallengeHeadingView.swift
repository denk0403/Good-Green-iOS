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
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color(Constants.gunmetal), lineWidth: 1))
            Text(feedObject.challenge.name)
                .font(.custom("Helvetica Neue", size: 18))
                .foregroundColor(Color(Constants.gunmetal))
            .padding()
        }


    }
}

struct FeedObjectChallengeHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        FeedObjectChallengeHeadingView(feedObject: Constants.fo1)
    }
}
