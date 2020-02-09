//
//  SearchView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI
import Foundation

struct SearchView: View {
    @State private var searchingType: SearchType = .users
    @State private var searchQuery: String = ""
    @State private var loading: Bool = true
    @State private var users: [User] = []
    @State private var challenges: [Challenge] = []
    @State private var isError = false
    @Environment(\.appService) var appService: AppService
    
    let timer = Timer.publish(every: 2, on: .current, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color(Constants.whiteSmoke).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                SearchBarView(search: self.$searchQuery, searchType: self.$searchingType).padding()
                Spacer()
                Spacer()
                SelectSearchTypeView(type: self.$searchingType, loading: self.$loading)
                Spacer()
                Spacer()
                if isError {
                    AnyView(Button(action: {
                        self.isError = false
                    }) {
                        Text("Click here to retry")
                    })
                } else {
                    AnyView(LoadingView(isLoading: self.loading) {
                        self.searchingType == .users ? AnyView(UserListSearchView(users: self.users))
                            : AnyView(ChallengeListSearchView(challenges: self.challenges))
                    }.onAppear {
					self.searchingType == .users
						? self.appService.getUsers(query: self.searchQuery, callback: {
							
							if let users = $0 {
								self.users = users
							} else {
								self.isError = true
							}
							self.loading = false

							
						})
						: self.appService.searchChallenges(query: self.searchQuery, callback: {
							
							if let challenges = $0 {
								self.challenges = challenges
							 } else {
								self.isError = true
							}
							self.loading = false
							
						})
					}.onReceive(timer) {_ in
                        self.searchingType == .users
                        ? self.appService.getUsers(query: self.searchQuery, callback: {
                            
                            if let users = $0 {
                                self.users = users
                            } else {
                                self.isError = true
                            }
                            self.loading = false

                            
                        })
                        : self.appService.searchChallenges(query: self.searchQuery, callback: {
                            
                            if let challenges = $0 {
                                self.challenges = challenges
                             } else {
                                self.isError = true
                            }
                            self.loading = false
                            
                        })
                    }
                    )
                }
            }
        }
            
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environment(\.appService, AppServiceImpl())
    }
}

