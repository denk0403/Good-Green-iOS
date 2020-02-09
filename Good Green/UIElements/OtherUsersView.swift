//
//  OtherUsersView.swift
//  Good Green
//
//  Created by Jack Rosen on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct OtherUsersView: View {
	let user: User
	let feedObjects: [FeedObject]
	
	@Environment(\.appService) var appService: AppService
	
    var body: some View {
		ZStack {
			Color(Constants.whiteSmoke).edgesIgnoringSafeArea(.all)
			VStack {
				HomeHeaderView(user: user)
				Button(action: {
					self.appService.followUser(userID: self.user.id) {_ in 
					}
				}) {
					ZStack {
						Text("Follow").font(.custom("Helvetica Neue", size: 20)).padding([.leading, .trailing]).foregroundColor(Color.white)
						.overlay(RoundedRectangle(cornerRadius: 5).stroke())
					}
					
				}.background(Color(Constants.mint))
				FeedListView(feedObjects: feedObjects)
			}
		}
    }
}

struct OtherUsersView_Previews: PreviewProvider {
    static var previews: some View {
		OtherUsersView(user: Constants.user1, feedObjects: [Constants.fo1, Constants.fo2, Constants.fo3]).environment(\.appService, AppServiceImpl())
    }
}
