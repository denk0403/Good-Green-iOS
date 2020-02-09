//
//  ChallengeInfoView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeInfoView: View {
    let challenge: Challenge = Constants.challenge1
    let nameSize: CGFloat = 30
    let detailsSize: CGFloat = 15
    
    var body: some View {
        VStack {
            Text(challenge.name).font(.custom("Helvetica Neue", size: nameSize))
            HStack {
                VStack {
                    Text(String(challenge.challengeUsers.count)).font(.custom("Helvetica Neue", size: detailsSize))
                    Text("Competing").font(.custom("Helvetica Neue", size: detailsSize))
                }
                VStack {
                    Text(String(challenge.challengeUsers.count)).font(.custom("Helvetica Neue", size: detailsSize))
                    Text("Completed").font(.custom("Helvetica Neue", size: detailsSize))
                }
            }
        }
    }
}

struct ChallengeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeInfoView()
    }
}
