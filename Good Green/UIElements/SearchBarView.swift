//
//  SearchBarView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
     let cornerR: CGFloat = 12
    
    @Binding var search: String
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                    .fill(Color(Constants.whiteSmoke))
                    .frame(width: 319, height: 32.34)
                   .overlay(
                       RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                        .stroke(Color(Constants.gunmetal), lineWidth: 1))
                TextField("Search a user", text: self.$search).padding([.leading, .trailing])
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 290, bottom: 0, trailing: 0))
                    .onTapGesture {
                        print("Do some shit broo")
                    }
                }
            .frame(width: 319, height: 32.34)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(search: Binding(get: {
            "Hello"
        }, set: {_ = $0})
        )}
}
