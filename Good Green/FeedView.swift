//
//  FeedView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedView: View {
	@State private var isLoading = true
	@State private var hasError = false
	@State private var feedObjects = [FeedObject]()
	@Environment(\.appService) var appService: AppService
	
    var body: some View {
		if hasError {
			return AnyView(self.errorView)
		}
		return AnyView(self.loadingView)
    }
	
	var errorView: some View {
		Button(action: { withAnimation { self.isLoading = true }}) {
			Text("There was an error retrieving your data.")
		}
	}
	
	var loadingView: some View {
		LoadingView(isLoading: self.isLoading) {
			ZStack {
				Color(Constants.whiteSmoke).edgesIgnoringSafeArea(.all)
				VStack {
					Image("logo").resizable().scaledToFit().padding()
					self.feedObjects.isEmpty ? AnyView(self.emptyView) : AnyView(self.nonEmptyView)
				}
			}
		}.onAppear {
			self.appService.getFeed(offset: 0) {
				self.isLoading = false
				self.hasError = $0 == nil
				self.feedObjects = $0 ?? []
			}
		}
	}
	
	var emptyView: some View {
		VStack {
			Spacer()
			Text("You have no feed events. Add people by searching for them below.")
			Image(systemName: "ArrowDown").resizable().scaledToFill()
			Spacer()
		}
	}
	
	var nonEmptyView: some View {
		FeedListView(feedObjects: self.feedObjects)
	}
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
