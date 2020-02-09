//
//  ChallengeImageView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeImageView: View {
    let iconSize: CGFloat = 100
    var body: some View {
        Circle()
            .fill(Color(Constants.ufoGreen))
            .frame(width: iconSize*10/9 + 1, height: iconSize*10/9 + 1)
            .offset(x: -6, y: 0)
            .overlay(
        Circle()
            .stroke(Color(Constants.gunmetal), lineWidth: 2)
            .frame(width: iconSize*10/9 + 1, height: iconSize*10/9 + 1)
            .offset(x: -6, y: 0))
    }
}

struct ChallengeImageView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeImageView()
    }
}
