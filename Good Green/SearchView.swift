//
//  SearchView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Color(Constants.whiteSmoke)
            SearchBarView()
            .offset(y: -340)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
