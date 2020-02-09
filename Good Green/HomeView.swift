//
//  HomeView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
       //let user: User = Constants.user1
        ZStack {
            Color(Constants.whiteSmoke)
            VStack {
               // HomeHeaderView()
                HStack {
                    ActiveChallengesButtonView()
                        .padding(EdgeInsets(top: 0, leading: 190, bottom: 0, trailing: 0))
                        .frame(width: 98, height: 24)
                    CompletedChallengesButtonView()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 600, trailing: 0))
            }
        }.edgesIgnoringSafeArea(.all)
        
//        List {
//            ForEach(user.activeChallenges, id: \.id) { feedObject in
//                FeedObjectView(feedObject: feedObject)
//            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
