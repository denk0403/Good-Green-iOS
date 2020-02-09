//
//  SelectSearchTypeView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

enum SearchType {
    case users, challenges
}

struct SelectSearchTypeView: View {
    
    let buttonWidth: CGFloat = 175
    let buttonHeight: CGFloat = 30
    let buttonTextSize: CGFloat = 13
    let buttonCornerRadius: CGFloat = 10
    let buttonStrokeColor = Color(Constants.gunmetal)
    let buttonFontFamily = "Helvetics Neue"
    
    @Binding var type: SearchType
    @Binding var loading: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.loading = true
                self.type = .users
            }) {
                RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(Text("Users").foregroundColor(Color(Constants.gunmetal)).font(.custom(buttonFontFamily, size: buttonTextSize)))
                    .foregroundColor(type == .users ? Color(Constants.ufoGreen) : Color(Constants.whiteSmoke)).overlay(RoundedRectangle(cornerRadius: buttonCornerRadius).stroke(buttonStrokeColor))
            }
            Button(action: {
                self.loading = true
                self.type = .challenges
            }) {
                RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(Text("Challenges").foregroundColor(Color(Constants.gunmetal)).font(.custom(buttonFontFamily, size: buttonTextSize)))
                    .foregroundColor(type == .challenges ? Color(Constants.ufoGreen) : Color(Constants.whiteSmoke)).overlay(RoundedRectangle(cornerRadius: buttonCornerRadius).stroke(buttonStrokeColor))
            }
        }
    }
}

//struct SelectSearchTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectSearchTypeView()
//    }
//}
