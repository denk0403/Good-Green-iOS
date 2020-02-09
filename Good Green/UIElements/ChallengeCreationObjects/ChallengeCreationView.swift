//
//  ChallengeCreationView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeCreationView: View {
    @State private var challengeName: String = ""
     @State private var selectedVibe = 0
    @State private var challengeDesc: String = ""
    @Environment(\.appService) var appService: AppService
    
    let buttonWidth: CGFloat = 175
       let buttonHeight: CGFloat = 30
       let buttonTextSize: CGFloat = 13
       let buttonCornerRadius: CGFloat = 10
    
     let iconSize: CGFloat = 100
    var body: some View {
        ZStack {
            Color(Constants.whiteSmoke)
        VStack {
            ChallengeImageView()
                VStack {
                    SetChallengeNameView(challengeName: self.$challengeName)
                    SetChallengeDescrView(challengeDesc: self.$challengeDesc)
                        Button(action: {
                            self.createNewChallenge()
                        }) {
                            RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth / 2, height: buttonHeight)
                            .foregroundColor(Color(Constants.mint))
                            .overlay(
                                Text("Create")
                                    .foregroundColor(Color(Constants.gunmetal))
                                        .font(.custom("Helvetics Neue", size: buttonTextSize)))
                    }
                }

           
            ChallengeCreationHeaderView(selectedVibe: self.$selectedVibe)
        }.padding(.bottom, 200)
        }
    }
    
    func createNewChallenge() -> Void {
        appService.createChallenge(name: challengeName, description: challengeDesc, vibe: Vibe.allVibesNotString[selectedVibe], icon: Image("leaf.arrow.circlepath"), callback: {
            _ = $0
        })
    }
}

struct ChallengeCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCreationView()
    }
}
