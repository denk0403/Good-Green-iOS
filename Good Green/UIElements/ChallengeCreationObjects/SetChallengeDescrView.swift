//
//  SetChallengeDescrView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SetChallengeDescrView: View {
    @Binding var challengeDesc: String
     let iconSize: CGFloat = 100
    var body: some View {
        HStack {
                VStack {
                    TextField("Enter Challenge Descripion...", text: self.$challengeDesc)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 260)
                    .foregroundColor(Color(Constants.gunmetal))
                    .font(.custom("Helvetica Neue", size: 18))
                    .lineLimit(3)
            }
        }
    }
}

//struct SetChallengeDescrView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetChallengeDescrView()
//    }
//}
