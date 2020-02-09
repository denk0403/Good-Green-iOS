//
//  SetChallengeDescrView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SetChallengeDescrView: View {
    @State private var challengeDesc: String = ""
     let iconSize: CGFloat = 100
    var body: some View {
        HStack {
                Circle()
                    .fill(Color(Constants.ufoGreen))
                    .frame(width: iconSize*10/9 + 1, height: iconSize*10/9 + 1)
                    .offset(x: -6, y: 0)
                    .overlay(
                Circle()
                    .stroke(Color(Constants.gunmetal), lineWidth: 2)
                    .frame(width: iconSize*10/9 + 1, height: iconSize*10/9 + 1)
                    .offset(x: -6, y: 0))
                VStack {
                        TextField("Enter Challenge Descripion...", text: $challengeDesc)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 260)
                    .foregroundColor(Color(Constants.gunmetal))
                    .font(.custom("Helvetica Neue", size: 18))
                    .lineLimit(3)
            }
        }
    }
}

struct SetChallengeDescrView_Previews: PreviewProvider {
    static var previews: some View {
        SetChallengeDescrView()
    }
}
