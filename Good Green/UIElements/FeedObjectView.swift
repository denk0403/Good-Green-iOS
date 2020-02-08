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
    
    @State private var isLoading = true
    
    var plantImg = "plant-selected"
    
    let cornerR: CGFloat = 12
    var body: some View {
        AnyView(self.isLoading ? AnyView(Text("Hello")) :
        AnyView(VStack {
            // main body showing challenge, icon, and description
            ZStack {
                RoundedRectangle(cornerRadius: self.cornerR, style: .continuous)
                    .fill(Color(self.whiteSmoke))
                    .frame(width: 319, height: 124.34)
                    .overlay(
                        RoundedRectangle(cornerRadius: self.cornerR, style: .continuous)
                            .stroke(Color(self.gunmetal), lineWidth: 1))
                
                Image(systemName: "house.fill")
                .resizable()
                    .frame(width: 32, height: 32)
                .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color(self.gunmetal), lineWidth: 1))
                    .offset(x: -130, y: -30)
                
                    // challenge name
                Text(self.feedObject.challenge.name)
                        .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color(self.gunmetal))
                        .offset(x: -55, y: -6)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 50, trailing: 50))
                       
                    // challenge description
                Text(self.feedObject.challenge.description)
                        .font(.custom("Helvetica Neue", size: 9))
                    .foregroundColor(Color(self.gunmetal))
                     .padding(EdgeInsets(top:10, leading: 50, bottom: 0, trailing: 50))
                        .frame(idealHeight: 80, maxHeight: 100)
                
                // like button
                VStack {
                    Button(action: {
                        var fov = FeedObjectView(feedObject: self.feedObject)
                        fov.determineLikeSprite()
                        //self.determineLikeSprite()
                    }) {
                        Image(self.getPlantImg())
                            .resizable()
                                .frame(width: 29, height: 29)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: -130, y: 41)
                    Text("\(self.getNumerOfLikes()) likes")
                        .font(.custom("Helvetica Neue", size: 6))
                        .foregroundColor(Color(self.gunmetal))
                        .offset(x: -130, y: 35)
                        .frame(width: 25)
                }
                
                // comment button
//                VStack {
//                Button(action: {
//                   // self.likeChallenge()
//                }) {
//                Image(determineLikeSprite())
//                .resizable()
//                    .frame(width: 29, height: 29)
//                    .offset(x: 130, y: 43)
//                }
//                Text("\(self.getNumerOfLikes()) likes")
//                    .font(.custom("Helvetica Neue", size: 6))
//                    .foregroundColor(Color(gunmetal))
//                    .offset(x: 130, y: 35)
//                }
                }
            
                // who did it and what they did bubble at top
            RoundedRectangle(cornerRadius: self.cornerR, style: .continuous)
                .fill(Color(self.ufoGreen))
                               .frame(width: 201, height: 17)
                    .offset(y: -140)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 100))
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: self.cornerR, style: .continuous)
                            .stroke(Color(self.gunmetal), lineWidth: 1)
                            .offset(x: -45, y: -140)
                            .frame(width: 201, height: 17)
                        HStack {
                            Button(action: {
                                self.visitUserPage()
                            }) {
                                Text(self.feedObject.user.name)
                                .font(.custom("Helvetica Neue", size: 12))
                                    .foregroundColor(Color(self.whiteSmoke))
                            }
                            Text("completed a challenge")
                            .font(.custom("Helvetica Neue", size: 12))
                                .foregroundColor(Color(self.gunmetal))
                        }.offset(x: -60, y: -140)
                            .frame(alignment: .leading)
                    }
                    
                )
            })).onTapGesture {
            self.isLoading = false
            print(self.isLoading)
        }
    }
    
    func visitUserPage() -> Void {
        print("Username Tapped!")
    }
    
    func textBasedOnFeedType() -> String {
        return "completed a challenge"
    }
    
     mutating func determineLikeSprite() -> Void {
        if(plantImg == "plant-unselected") {
            print("selected")
            plantImg = "plant-selected"
        } else if (plantImg == "plant-selected") {
            print("deselected")
            plantImg = "plant-unselected"
        } else {
            print("selected")
            plantImg = "plant-unselected"
        }
    }
    
    func getNumerOfLikes() -> Int {
        // TO-DO
        return 11
    }
    
    func getNumberOfComments() -> Int {
        return 0
    }
    
    func getPlantImg() -> String {
        return plantImg
    }
}

struct FeedObjectView_Previews: PreviewProvider {
    
    static var previews: some View {
        
//        let user = User(userImage: Image(systemName: "house"), name: "Levi", bio: "hello", activeChallenges: [], previousChallenges: [], followers: [], following: []);
//
//        let challenge = Challenge(name: "challenge 1", iconImage:Image(systemName: "house"), vibe: Vibe.water, description: "Grab a shovel and get digging! You can find saplings at hardware stores or anywhere that sells trees. Make it a goal to plant one every month and soon you’ll have a whole grove!", challengeUsers: []);
//
//        let feedObject2 = FeedObject(id: 1, user: user, challenge: challenge, likes: [], feedType: FeedType.completed);
        
        return FeedObjectView(feedObject: Constants.fo3)
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
