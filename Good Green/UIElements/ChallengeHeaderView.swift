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
            challenge.iconImage.resizable().frame(width: iconSize, height: iconSize).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
            ChallengeInfoView()
        }
    }
}

struct ChallengeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeHeaderView(challenge: Constants.challenge1)
    }
}
