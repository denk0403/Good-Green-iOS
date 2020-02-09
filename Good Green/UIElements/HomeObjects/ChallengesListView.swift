//
//  ActiveChallengesListView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengesListView: View {
    let progresses: [Progress]
    var body: some View {
            List {
                ForEach(progresses) {progress in
                    HStack {
                        Spacer()
                        ProgressView(progress: progress)
                        Spacer()
                    }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
    }.colorMultiply(Color(Constants.whiteSmoke))
    }
}

struct ActiveChallengesListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesListView(progresses: [Constants.progress1, Constants.progress2])
    }
}
