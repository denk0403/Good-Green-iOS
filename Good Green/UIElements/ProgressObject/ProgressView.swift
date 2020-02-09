//
//  ProgressView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
     let progress: Progress
    var body: some View {
        VStack {
            // main body showing challenge, icon, and description
            ZStack {
               FeedObjectBackgroundRectView()
                VStack(alignment: .leading) {
                        Button(action: {
                                           self.visitChallengePage()
                                       }) {
                        ProgressChallengeHeadingView(progress: progress)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        }
                        // challenge description
                        ProgressBodyView(progress: progress)
                        
					FeedObjectLikeButtonView(feedObject: Constants.fo1)
                    }
                        }
        }.frame(width: 320, height: 125)
    }
        
        func visitChallengePage() -> Void {
            print ("Visiting challenge page")
        }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progress: Constants.progress1)
    }
}
