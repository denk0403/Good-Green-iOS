//
//  HomeView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var activeType: ActivationType = .active
    @State private var loading: Bool = true
    
    
    let user: User;
    
    var body: some View {
        ZStack {
            Color(Constants.whiteSmoke)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HomeHeaderView(user: user)
                HomeActiveComplChallView(type: self.$activeType)
//                FeedListView(: user.activeChallenges)
                ChallengesListView(progresses: self.activeType == .active ? user.activeChallenges : user.previousChallenges)
            }
            }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        HomeView(user: Constants.user1)
        }
    }
}
