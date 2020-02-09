//
//  ChallengeListSearchView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeListSearchView: View {
    let challenges: [Challenge]
    
    var body: some View {
        List {
                ForEach(challenges, id: \.id) { challenge in
                    HStack {
                        Spacer()
                        ChallengeCardView(challenge: challenge)
                        Spacer()
                    }
            }
        }.colorMultiply(Color(Constants.whiteSmoke))
    }
}

struct ChallengeListSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeListSearchView(challenges: [Constants.challenge1, Constants.challenge2, Constants.challenge3, Constants.challenge4 ])
    }
}
