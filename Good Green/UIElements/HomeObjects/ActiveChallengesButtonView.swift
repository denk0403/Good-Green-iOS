//
//  ActiveChallengesButtonView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ActiveChallengesButtonView: View {
    
    let cornerR: CGFloat = 12
    
    var body: some View {
        ZStack {
           
            RoundedRectangle(cornerRadius: cornerR, style: .continuous)
//                .fill(Color(Constants.whiteSmoke))
                .frame(width: 98, height: 24)
               .overlay(
                   RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                    .stroke(Color(Constants.gunmetal), lineWidth: 1))
             Text("Active Challenges")
                .font(.custom("Helvetica Nueue", size: 11))
                .foregroundColor(Color(Constants.gunmetal))
            }
        .frame(width: 319, height: 32.34)
    }
}

struct ActiveChallengesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveChallengesButtonView()
    }
}
