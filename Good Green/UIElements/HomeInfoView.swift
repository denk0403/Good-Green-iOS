//
//  HomeInfoView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct HomeInfoView: View {
    let user: User;
    let nameSize: CGFloat = 30
    let detailsSize: CGFloat = 15
    
    var body: some View {
        VStack {
            Text(user.name).font(.custom("Helvetica Neue", size: nameSize))
            HStack {
                VStack {
            Text(String(user.followers.count)).font(.custom("Helvetica Neue", size: detailsSize))
            Text("Followers").font(.custom("Helvetica Neue", size: detailsSize))
            }
            VStack {
            Text(String(user.following.count)).font(.custom("Helvetica Neue", size: detailsSize))
                Text("Following").font(.custom("Helvetica Neue", size: detailsSize))
                }
            VStack {
            Text(String(user.activeChallenges.count)).font(.custom("Helvetica Neue", size: detailsSize))
                Text("Challenges").font(.custom("Helvetica Neue", size: detailsSize))
                }
            }
        }
    }
}

struct HomeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeInfoView(user: Constants.user1)
    }
}



