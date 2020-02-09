//
//  LoadingView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    let isLoading: Bool
    
    let content: () -> Content
    var body: some View {
        if self.isLoading {
            return AnyView(ZStack {
                Color(Constants.whiteSmoke)
                HStack {
                    Image(systemName: "hare").resizable().frame(width: 50, height: 40)
                    Text("Loading...").font(.custom("Helvetica Neue", size: 25))
                }
                
            })
        } else {
            return AnyView(content())
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true) {
            Text("Mine")
        }
    }
}
