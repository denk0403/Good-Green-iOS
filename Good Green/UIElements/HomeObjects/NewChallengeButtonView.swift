//
//  NewChallengeButtonView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct NewChallengeButtonView: View {
     let cornerR: CGFloat = 12
    var body: some View {
        ZStack {
                   
        RoundedRectangle(cornerRadius: cornerR, style: .continuous)
            .fill(Color(Constants.mint))
            .frame(width: 80, height: 24)
           .overlay(
               RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                .stroke(Color(Constants.gunmetal), lineWidth: 1))
         Text("New Challenge")
            .font(.custom("Helvetica Nueue", size: 11))
            .foregroundColor(Color(Constants.gunmetal))
        }
                .frame(width: 80, height: 24)

    }
}

struct NewChallengeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewChallengeButtonView()
    }
}
