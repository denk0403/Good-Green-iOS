//
//  ProgressChallengeHeadingView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ProgressChallengeHeadingView: View {
        
     let progress: Progress
    
    var body: some View {
        HStack {
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color(Constants.gunmetal), lineWidth: 1))
                .scaledToFit()
            Text(progress.challenge.name)
                .font(.custom("Helvetica Neue", size: 18))
                .foregroundColor(Color(Constants.gunmetal))
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
        }


    }
}

struct ProgressChallengeHeadingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChallengeHeadingView(progress: Constants.progress1)
    }
}
