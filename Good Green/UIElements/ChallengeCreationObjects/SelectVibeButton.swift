//
//  SelectVibeButton.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct SelectVibeButton: View {
    @State private var selectedVibe = 0
    @State private var shouldShowVibePicker = false
    @State private var showModal = false
    
    let buttonWidth: CGFloat = 175
       let buttonHeight: CGFloat = 30
       let buttonTextSize: CGFloat = 13
       let buttonCornerRadius: CGFloat = 10
    
    var body: some View {
        VStack {
            HStack {
        Button(action: {
            self.vibePicker()
        }) {
            
            RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth, height: buttonHeight)
                .overlay(
                    Text(Vibe.allVibes[selectedVibe])
                        .foregroundColor(Color(Constants.gunmetal))
                        .font(.custom("Helvetics Neue", size: buttonTextSize)))
            .foregroundColor(Color(Constants.ufoGreen))
            }
                
                Button(action: {
                    self.closePicker()
                }) {
             RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth / 2, height: buttonHeight)
                .foregroundColor(Color(Constants.ufoGreen))
                .overlay(
                    Text("OK")
                        .foregroundColor(Color(Constants.gunmetal))
                            .font(.custom("Helvetics Neue", size: buttonTextSize)))
                .opacity(shouldShowVibePicker ? 100 : 0)
                        
                }
            
            
            Button(action: {
                print ("navigating")
            }) {
                RoundedRectangle(cornerRadius: buttonCornerRadius).frame(width: buttonWidth / 2, height: buttonHeight)
                .foregroundColor(Color(Constants.mint))
                .overlay(
                    Text("Create")
                        .foregroundColor(Color(Constants.gunmetal))
                            .font(.custom("Helvetics Neue", size: buttonTextSize)))
            }
            }
            
            if (shouldShowVibePicker) {
                NavigationView {
                    Form {
                        Picker(selection: $selectedVibe, label: Text("Vibe")) {
                            ForEach(0 ..< Vibe.allVibes.count) {
                                Text(Vibe.allVibes[$0]).tag($0)
                            }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                }
            }

            
            
        }
    }
    
    func vibePicker() -> Void {
        shouldShowVibePicker = true
    }
    
    func closePicker() -> Void {
        shouldShowVibePicker = false
    }
}

struct SelectVibeButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectVibeButton()
    }
}
