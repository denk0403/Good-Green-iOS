//
//  HomeHeaderView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct HomeHeaderView: View {
    let user: User;
    var body: some View {
        HStack {
            Circle()
                .stroke(Color(Constants.gunmetal), lineWidth: 2)
                .frame(width: 70)
                .overlay(
            Image(systemName: "flame")
                .resizable()
                .frame(width: 60, height: 60))
            HomeInfoView(user: user)
        }.scaledToFit()
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView(user: Constants.user1)
    }
}
