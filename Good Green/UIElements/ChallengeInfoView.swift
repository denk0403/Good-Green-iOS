//
//  ChallengeInfoView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeInfoView: View {
    let challenge: Challenge
    let nameSize: CGFloat = 30
    let detailsSize: CGFloat = 15
    
    var body: some View {
        VStack {
            Text(challenge.name).font(.custom("Helvetica Neue", size: nameSize))
            Text("Created By: \(self.challenge.creator.name)").font(.custom("Helvetica Neue", size: detailsSize - 2)).padding(EdgeInsets(top: 2, leading: 20, bottom: 20, trailing: 20))
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

//struct ChallengeInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeInfoView()
//    }
//}
