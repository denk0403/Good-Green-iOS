//
//  FeedListView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedListView: View {
	let feedObjects: [FeedObject]
    var body: some View {
		List{
			ForEach(feedObjects, id: \.id) { feedObject in
                VStack {
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        FeedObjectView(feedObject: feedObject)
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                }
			}
			}.colorMultiply(Color(Constants.whiteSmoke))
        
    }
}

struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        FeedListView(feedObjects: [Constants.fo1, Constants.fo2, Constants.fo3, Constants.fo1, Constants.fo1, Constants.fo2, Constants.fo3, Constants.fo1])
    }
}
