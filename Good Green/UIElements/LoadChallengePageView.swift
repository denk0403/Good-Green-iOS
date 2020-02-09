//
//  LoadChallengePageView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

enum ChallengeSubscription {
    case waiting, active, inactive
}

struct LoadChallengePageView: View {
    
    @Environment(\.appService) var appService: AppService
    @State private var isError: Bool = false
    @State private var challenge: Challenge = Challenge(id: "-1", name: "", iconImage: Image(""), vibe: .animals, description: "", threshold: 0, creator: Constants.user1)
    @State private var subscription: ChallengeSubscription = .waiting
    
    let challengeId: String;
    
    var body: some View {
        if (isError) {
            return AnyView(Button(action: {
                self.isError = false
            }) {
                Text("Click here to retry")
            })
        } else {
            return AnyView(LoadingView(isLoading: self.challenge.id == "-1" || self.subscription == .waiting) {
                ChallengePageView(challenge: self.challenge, subscription: self.$subscription)
            }.onAppear {
                self.appService.getChallenge(challengeID: self.challenge.id, callback: {
                    if let challenge = $0 {
                        self.challenge = challenge
                    } else {
                        self.isError = true;
                    }
                })
                
                self.appService.getUserActiveChallenges(callback: {
                    if let progresses = $0 {
                        self.subscription = progresses.contains(where: {
                            $0.id == self.challenge.id
                            }) ? .active : .inactive
                    } else {
                        self.isError = true;
                        self.subscription = .waiting
                    }
                })
            }
            )
        }
    }
}

struct LoadChallengePageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadChallengePageView(challengeId: "1").environment(\.appService, AppServiceImpl())
    }
}
