//
//  ChallengePageView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengePageView: View {
    let challenge: Challenge
    
    var body: some View {
        Rectangle().fill(Color(Constants.whiteSmoke)).edgesIgnoringSafeArea(.all).overlay(VStack {
            ChallengeHeaderView(challenge: challenge)
            ChallengeControlView(challenge: challenge)
            ChallengeDescriptionView(challenge: challenge)
        })
    }
}

struct ChallengePageView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengePageView(challenge: Constants.challenge1)
    }
}
