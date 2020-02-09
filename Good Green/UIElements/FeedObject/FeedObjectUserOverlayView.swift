//
//  FeedViewUserOverlayView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedObjectUserOverlayView: View {
     let feedObject: FeedObject
    
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerR, style: .continuous)
                        .fill(Color(Constants.ufoGreen))
                                   .frame(width: 201, height: 17)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: Constants.cornerR, style: .continuous)
                                    .stroke(Color(Constants.gunmetal), lineWidth: 1)
                                .frame(width: 201, height: 17)
                            HStack {
                                Button(action: {
                                    self.visitUserPage()
                                }) {
                                    Text(feedObject.user.name)
                                        .font(.custom("Helvetica Neue", size: 10))
                                        .frame(maxWidth: 85)
                                        .foregroundColor(Color(Constants.coral))
                                }
                                Text("completed a challenge")
                                .font(.custom("Helvetica Neue", size: 10))
                                    .foregroundColor(Color(Constants.gunmetal))
                            }
                        }
                    )
    }
    
    func visitUserPage() -> Void {
           print("Username Tapped!")
       }
}

struct FeedViewUserOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        FeedObjectUserOverlayView(feedObject: Constants.fo1)
    }
}
