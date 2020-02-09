//
//  FeedListView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedListView: View {
    let feedObjects = [Constants.fo1, Constants.fo2, Constants.fo3, Constants.fo1, Constants.fo1, Constants.fo2, Constants.fo3, Constants.fo1 ]
    var body: some View {
        List {
            ForEach(feedObjects, id: \.id) { feedObject in
                FeedObjectView(feedObject: feedObject)
            }
        }
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView()
    }
}
