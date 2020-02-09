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
    
    @Environment(\.appService) var appService: AppService
    @State private var selected: AccessAccountType = .waiting
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
	@State private var selection: Int? = nil
    
    var body: some View {
        let validState = (self.selected == .login && (!self.username.isEmpty && !self.password.isEmpty))
            || ( self.selected == .signup && (!self.username.isEmpty && !self.password.isEmpty) && (self.password == self.confirmPassword))
		return NavigationView {
			ZStack{
				NavigationLink("", destination: ContentView(), tag: 0, selection: self.$selection)
            Color(Constants.whiteSmoke).edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Image("logo").resizable().scaledToFit().onTapGesture {
                            withAnimation {
                                self.selected = .waiting
                            }
                        }
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
                        VStack {
                            ZStack {
                                    RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                                        .fill(Color(Constants.whiteSmoke))
                                        .frame(width: 319, height: 32.34)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                                            .stroke(Color(Constants.gunmetal), lineWidth: 1))
                                    TextField("Enter a username", text: self.$username).padding([.leading, .trailing])
                                }.frame(width: 319, height: 32.34)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            
                            
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                                    .fill(Color(Constants.whiteSmoke))
                                    .frame(width: 319, height: 32.34)
                                   .overlay(
                                       RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                                        .stroke(Color(self.selected == .signup && self.password != self.confirmPassword ? Constants.coral : Constants.gunmetal), lineWidth: self.selected == .signup && self.password != self.confirmPassword ? 2 : 1))
                                TextField("Enter a pasword", text: self.$password).padding([.leading, .trailing])
                            }.frame(width: 319, height: 32.34).padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            
                            if (self.selected == .signup) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                                        .fill(Color(Constants.whiteSmoke))
                                        .frame(width: 319, height: 32.34)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: buttonCornerRadius, style: .continuous)
                                            .stroke(Color(self.selected == .signup && self.password != self.confirmPassword ? Constants.coral : Constants.gunmetal), lineWidth: self.selected == .signup && self.password != self.confirmPassword ? 2 : 1))
                                    TextField("Confirm pasword", text: self.$confirmPassword).padding([.leading, .trailing])
                                }.frame(width: 319, height: 32.34).padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            }
                            
                            Button(action: {
                                self.selected == .login
                                    ? self.appService.authUser(username: self.username, password: self.password, callback: {
										if $0 != nil {
											self.selection = 0
										}
                                    })
                                    : self.appService.createUser(username: self.username, password: self.password, callback: {
                                        if $0 != nil {
											self.selection = 0
										}
                                    })
                            }) {
                                RoundedRectangle(cornerRadius: buttonCornerRadius)
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .overlay(RoundedRectangle(cornerRadius: buttonCornerRadius)
                                        .stroke(Color(Constants.gunmetal)))
                                    .overlay(Text("Submit")
                                            .foregroundColor(Color(Constants.gunmetal)).font(.custom("Helvetics Neue", size: buttonTextSize)))
                                    .foregroundColor(validState ? Color.green : Color.gray)
                            }.disabled(!validState).transition(.scale).padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0)).opacity(validState ? 1 : 0.25)

                        }.padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                    }
                        
                    }
                        
        }
		}

        
    }
}

struct AccessAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccessAccountView().environment(\.appService, AppServiceImpl())
    }
}
