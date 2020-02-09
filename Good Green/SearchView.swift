//
//  SearchView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var searchingType: SearchType = .users
    var body: some View {
        ZStack {
            Color(Constants.whiteSmoke).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                SearchBarView()
                Spacer()
                Spacer()
                SelectSearchTypeView(type: self.$searchingType)
                Spacer()
                Spacer()
                UserListSearchView(users: [Constants.user1, Constants.user2, Constants.user3, Constants.user4])
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}