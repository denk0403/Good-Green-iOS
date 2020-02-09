//
//  ChallengeDescriptionView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeDescriptionView: View {
    let challenge: Challenge;
    let boxCornerRadius: CGFloat = 15;
    let textPadding: CGFloat = 15
    let textSize: CGFloat = 15
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: boxCornerRadius).fill(Color(Constants.whiteSmoke))
            .overlay(RoundedRectangle(cornerRadius: boxCornerRadius).stroke(Color(Constants.gunmetal)))
            Text(challenge.description).foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: textSize)).padding(textPadding)
        }
    }
}

struct ChallengeDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDescriptionView(challenge: Constants.challenge1)
    }
}
