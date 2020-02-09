//
//  FeedObjectBodyView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedObjectBodyView: View {
    
    let feedObject: FeedObject
    
    var body: some View {
        Text(feedObject.challenge.description)
            .font(.custom("Helvetica Neue", size: 9))
        .foregroundColor(Color(Constants.gunmetal))
            .frame(width: 300, height: 60)
    }
}

struct FeedObjectBodyView_Previews: PreviewProvider {
    static var previews: some View {
        FeedObjectBodyView(feedObject: Constants.fo1)
    }
}
