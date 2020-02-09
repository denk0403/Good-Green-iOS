//
//  FeedObjectBackgroundRectView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedObjectBackgroundRectView: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerR, style: .continuous)
           .fill(Color(Constants.whiteSmoke))
           .frame(width: 319, height: 140)
           .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerR, style: .continuous)
                   .stroke(Color(Constants.gunmetal), lineWidth: 1))
    }
}

struct FeedObjectBackgroundRectView_Previews: PreviewProvider {
    static var previews: some View {
        FeedObjectBackgroundRectView()
    }
}
