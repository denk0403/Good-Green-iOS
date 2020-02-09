//
//  ChallengeCardView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeCardView: View {
    
    let challenge: Challenge
    
    let cardCornerRadius: CGFloat = 12
    let textFontFamily = "Helvetica Neue"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
                .fill(Color(Constants.mint))
                .frame(width: 319, height: 32.34)
               .overlay(
                   RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
                    .stroke(Color(Constants.gunmetal), lineWidth: 1))
            Button(action: {
                
            }) {
                HStack {
                    challenge.iconImage
                    .overlay(
                        Circle().stroke(Color(Constants.gunmetal), lineWidth: 1)
                            .frame(width: 20, height: 20)
                    )
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    Text(challenge.name)
                        .font(.custom(textFontFamily, size: 20))
                        .foregroundColor(Color(Constants.gunmetal))
                    Spacer()
                    VStack(alignment: .center) {
                        Spacer()
                        Text("Created By: \(self.challenge.creator.name)")
                            .font(.custom(textFontFamily, size: 11))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 10)).fixedSize(horizontal: false, vertical: true).foregroundColor(Color(Constants.gunmetal))
    
                    }
                }
            }
            .frame(width: 319, height: 32)
        }
    }
}

struct ChallengeCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCardView(challenge: Constants.challenge1)
    }
}
