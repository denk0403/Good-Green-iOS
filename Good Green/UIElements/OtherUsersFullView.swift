//
//  OtherUsersFullView.swift
//  Good Green
//
//  Created by Jack Rosen on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct OtherUsersFullView: View {
	let user: User
	
	@Environment(\.appService) var appService: AppService
	
	@State private var feed: [FeedObject] = []
	@State private var isError = false
	
	@State private var startingUser = Constants.user1
    var body: some View {
		if isError {
			return AnyView(Button(action: {self.isError = false}) {
				Text("Click here to retry")
			})
		} else {
			return AnyView(LoadingView(isLoading: feed.isEmpty) {
				OtherUsersView(user: self.startingUser, feedObjects: self.feed)
			}.onAppear {
				self.appService.getUser(userID: self.user.id) {user in
					self.appService.getUserFeed(userID: self.user.id) {feed in
						guard let myFeed = feed, let myUser = user else {
							self.isError = true
							return
						}
						self.feed = myFeed
						self.startingUser = myUser
					}
				}
				
			})
		}
    }
}

struct OtherUsersFullView_Previews: PreviewProvider {
    static var previews: some View {
		OtherUsersFullView(user: Constants.user1)
    }
}
