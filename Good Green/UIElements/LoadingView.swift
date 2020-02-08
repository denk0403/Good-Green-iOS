//
//  LoadingView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    var isLoading: Bool
    
    let content: () -> Content
    var body: some View {
        if self.isLoading {
            return AnyView(Text("Loading"))
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
