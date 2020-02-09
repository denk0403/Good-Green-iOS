//
//  ProgressBodyView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ProgressBodyView: View {
    let progress: Progress
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(progress.challenge.description)
                .font(.custom("Helvetica Neue", size: 9))
            .foregroundColor(Color(Constants.gunmetal))
                .multilineTextAlignment(.leading)
            .lineLimit(3)
                .frame(width: 300)
                .frame(maxHeight: 100)
                .scaledToFit()
        }
    }
}

struct ProgressBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBodyView(progress: Constants.progress1)
    }
}
