//
//  FeedObjectView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedObjectView: View {
    
    let feedObject: FeedObject
    
    let whiteSmoke = UIColor(hex: "#f5f5eeff")!
    let ufoGreen = UIColor(hex: "#1ed884ff")!
    let mint = UIColor(hex: "#4eb285ff")!
    let gunmetal = UIColor(hex: "#2d334fff")!
    let coral = UIColor(hex: "#ff7f61ff")!
    
    let cornerR: CGFloat = 12
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerR, style: .continuous)
            .fill(Color(whiteSmoke))
                .frame(width: 319, height: 124.34)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                        .stroke(Color(gunmetal), lineWidth: 1))
            
            Image(systemName: "house.fill")
            .resizable()
                .frame(width: 32, height: 32)
            .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color(gunmetal), lineWidth: 1))
                .offset(x: -130, y: -30)
            
            Text(feedObject.challenge.name)
                .font(.headline)
                .offset(x: -60, y: -30)
        }
    }
}

struct FeedObjectView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let user = User(userImage: Image(systemName: "house"), name: "Levi", bio: "hello", activeChallenges: [], previousChallenges: [], followers: [], following: []);
        
        let challenge = Challenge(name: "challenge1", iconImage:Image(systemName: "house"), vibe: "sampleVibe", description: "dunno", challengeUsers: []);
        
        let feedObject2 = FeedObject(id: 1, user: user, challenge: challenge, likes: []);
        
        return FeedObjectView(feedObject: feedObject2)
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

