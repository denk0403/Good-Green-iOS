//
//  LogInView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

enum AccessAccountType {
    case waiting, login, signup
}

struct AccessAccountView: View {
    
    let buttonWidth: CGFloat = 170
    let buttonHeight: CGFloat = 40
    let buttonTextSize: CGFloat = 20
    let buttonCornerRadius: CGFloat = 10
    
    @State private var selected: AccessAccountType = .waiting
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        Button(action: {
            withAnimation { self.selected = .waiting }
        }) {
            ZStack{
                Color(Constants.whiteSmoke).edgesIgnoringSafeArea(.all)
        VStack {
            VStack {
            Image("logo").resizable().scaledToFit()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation { self.selected = .login }
                }) {
                    RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(RoundedRectangle(cornerRadius: buttonCornerRadius).stroke(Color(Constants.gunmetal))).overlay(Text("Log In").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                    .foregroundColor(Color(Constants.ufoGreen))
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation { self.selected = .signup }
                }) {
                    RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(RoundedRectangle(cornerRadius: buttonCornerRadius).stroke(Color(Constants.gunmetal))).overlay(Text("Sign Up").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                    .foregroundColor(Color(Constants.coral))
                }
                Spacer()
                }
                
            }
            
            if (self.selected != .waiting) {
//                self.selected == .login
//                    ? Form {
//
//                        }
//                    : Form {
//
//                }

                
                Button(action: {
                    
                }) {
                    RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight).overlay(RoundedRectangle(cornerRadius: buttonCornerRadius).stroke(Color(Constants.gunmetal))).overlay(Text("Submit").foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                        .foregroundColor(Color(Constants.whiteSmoke))
                }.transition(.scale)
            }
        
                }
                
            }
            
        }.buttonStyle(PlainButtonStyle())

        
    }
}

struct AccessAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccessAccountView()
    }
}
