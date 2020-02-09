//
//  ChallengeHeaderView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeHeaderView: View {
    let challenge: Challenge;
    let iconSize: CGFloat = 100
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color(Constants.ufoGreen))
                .frame(width: iconSize*10/9 + 1, height: iconSize*10/9 + 1)
                .offset(x: -6, y: 0)
                .overlay(
            Circle()
                .stroke(Color(Constants.gunmetal), lineWidth: 2)
                .frame(width: iconSize*10/9 + 1, height: iconSize*10/9 + 1)
                .offset(x: -6, y: 0)
                .overlay(
            challenge.iconImage.resizable().frame(width: iconSize, height: iconSize*10/9).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))))
            ChallengeInfoView()
        }
    }
}

struct ChallengeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeHeaderView(challenge: Constants.challenge1)
    }
}
