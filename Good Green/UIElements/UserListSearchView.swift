//
//  UserSearchView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct UserListSearchView: View {
    let users: [User]
    
    var body: some View {
        List {
                ForEach(users, id: \.id) { user in
                    HStack {
                        Spacer()
                        UserCardView(user: user)
                        Spacer()
                    }
            }
        }.colorMultiply(Color(Constants.whiteSmoke))
    }
}

struct UserListSearchView_Previews: PreviewProvider {
    static var previews: some View {
        UserListSearchView(users: [Constants.user1, Constants.user2, Constants.user3, Constants.user4])
    }
}
