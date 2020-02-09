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
    
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 30
    let buttonTextSize: CGFloat = 13
    let buttonCornerRadius: CGFloat = 10
    
    @Environment(\.appService) var appService: AppService
    @Binding var subscription: ChallengeSubscription
    
    var body: some View {
        Rectangle().fill(Color(Constants.whiteSmoke)).edgesIgnoringSafeArea(.all).overlay(VStack {
            ChallengeHeaderView(challenge: challenge).padding()
            self.subscription == .active
                ? AnyView(ChallengeControlView(challenge: challenge, subscription: self.$subscription))
                : AnyView(Button(action: {
                    self.appService.dropChallenge(challengeID: self.challenge.id, callback: {
                        if $0 {
                            self.subscription = .inactive
                        }
                    })
                }) {
                    RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(Text("Join challenge").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                    .foregroundColor(Color(Constants.ufoGreen))
                })
            ChallengeDescriptionView(challenge: challenge).padding()
            })
    }
}

struct ChallengePageView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengePageView(challenge: Constants.challenge1, subscription: Binding(get: {
            .inactive
        }, set: {_ = $0})
        ).environment(\.appService, AppServiceImpl())
    }
}
