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
    
    var body: some View {
            Button(action: {
                
            }) {
            ZStack {
               
                RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                    .fill(Color(Constants.whiteSmoke))
                    .frame(width: 319, height: 32.34)
                   .overlay(
                       RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                        .stroke(Color(Constants.gunmetal), lineWidth: 1))
                 Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 290, bottom: 0, trailing: 0))
                }
            .frame(width: 319, height: 32.34)
            }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
