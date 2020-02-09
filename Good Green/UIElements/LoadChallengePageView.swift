//
//  LoadChallengePageView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct LoadChallengePageView: View {
    
    @Environment(\.appService) var appService: AppService
    @State private var isError: Bool = false
    @State private var challenge: Challenge = Challenge(id: "-1", name: "", iconImage: Image(""), vibe: .animals, description: "", threshold: 0, creator: Constants.user1)
    
    let challengeId: String;
    
    var body: some View {
        if (isError) {
            return AnyView(Button(action: {
                self.isError = false
            }) {
                Text("Click here to retry")
            })
        } else {
            return AnyView(LoadingView(isLoading: self.challenge.id == "-1") {
                ChallengePageView(challenge: self.challenge)
            }.onAppear {
                self.appService.getChallenge(challengeID: self.challenge.id, callback: {
                    if let challenge = $0 {
                        self.challenge = challenge
                    } else {
                        self.isError = true;
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
