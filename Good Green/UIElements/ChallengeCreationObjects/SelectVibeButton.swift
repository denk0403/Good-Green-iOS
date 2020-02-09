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
    
    let buttonWidth: CGFloat = 175
       let buttonHeight: CGFloat = 30
       let buttonTextSize: CGFloat = 13
       let buttonCornerRadius: CGFloat = 10
    
    var body: some View {
        VStack {
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
            
            NavigationView {
                Form {
                Picker(selection: $selectedVibe, label: Text("Vibe")) {
                    ForEach(0 ..< Vibe.allVibes.count) {
                        Text(Vibe.allVibes[$0]).tag($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .opacity(shouldShowVibePicker ? 100 : 0)
            }
            }
        }
    }
    
    func vibePicker() -> Void {
        shouldShowVibePicker = true
    }
}

struct SelectVibeButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectVibeButton()
    }
}
