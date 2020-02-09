//
//  ChallengeControlView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeControlView: View {
    let challenge: Challenge;
    
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 30
    let buttonTextSize: CGFloat = 13
    let buttonCornerRadius: CGFloat = 10
    
    @Environment(\.appService) var appService: AppService
    @Binding var subscription: ChallengeSubscription;
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.appService.completeChallenge(challengeID: self.challenge.id, callback: {
                        _ = $0
                    })
                }) {
                    RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(Text("Mark as complete today").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                    .foregroundColor(Color(Constants.ufoGreen))
                }
                Button(action: {
                    self.appService.completeChallenge(challengeID: self.challenge.id, callback: {
                        _ = $0
                    })
                }) {
                    RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(Text("Mark as complete this week").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                        .foregroundColor(Color(Constants.ufoGreen))
                }
            }
            Button(action: {
                self.appService.dropChallenge(challengeID: self.challenge.id, callback: {
                    _ = $0
                })
            }) {
                RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(Text("End this challenge ").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize))).foregroundColor(Color(Constants.coral))
            }
        }
    }
}

struct ChallengeControlView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeControlView(challenge: Constants.challenge1, subscription: Binding(get: {
            .inactive
        }, set: {_ = $0})).environment(\.appService, AppServiceImpl())
    }
}
