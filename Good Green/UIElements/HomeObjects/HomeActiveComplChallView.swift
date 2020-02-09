//
//  HomeActiveComplChallView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

enum ActivationType {
    case active, completed
}

struct HomeActiveComplChallView: View {
    @Binding var type: ActivationType
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.type = .active
            }) {
                ActiveChallengesButtonView()
                    .foregroundColor(type == .active ? Color(Constants.ufoGreen) : Color(Constants.whiteSmoke))
                    .frame(width: 98, height: 24)
            }
            
            Button(action: {
                self.type = .completed
                }) {
                    CompletedChallengesButtonView()
                        .foregroundColor(type == .completed ? Color(Constants.ufoGreen) : Color(Constants.whiteSmoke))
                    .fixedSize()
                }
            Spacer()
            NavigationLink(destination: ChallengeCreationView()) {
                 NewChallengeButtonView()
            }
            Spacer()
        }
    }
}

struct HomeActiveComplChallView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeActiveComplChallView(type: Binding(get: {return .active}, set: {_ in}))
        }
    }
}
