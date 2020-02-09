//
//  SetChallengeNameView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SetChallengeNameView: View {
    @State private var challengeName: String = ""
    var body: some View {
        VStack {
            TextField("Enter Challenge Name...", text: $challengeName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250)
                .foregroundColor(Color(Constants.gunmetal))
                .font(.custom("Helvetica Neue", size: 18))
        }
    }
}

struct SetChallengeNameView_Previews: PreviewProvider {
    static var previews: some View {
        SetChallengeNameView()
    }
}
