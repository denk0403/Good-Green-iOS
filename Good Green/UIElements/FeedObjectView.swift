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
    

    
    @State private var plantImg = "plant-selected"
    
    let cornerR: CGFloat = 12
    var body: some View {
        VStack {
            // main body showing challenge, icon, and description
            ZStack {
                RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                    .fill(Color(Constants.whiteSmoke))
                    .frame(width: 319, height: 124.34)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                            .stroke(Color(Constants.gunmetal), lineWidth: 1))
               
                Button(action: {
                    self.visitChallengePage()
                }) {
                // challenge name
                    Text(feedObject.challenge.name)
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(Color(Constants.gunmetal))
                        .offset(x: -25, y: -6)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 50, trailing: 50))
                Image(systemName: "house.fill")
                .resizable()
                    .frame(width: 32, height: 32)
                .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color(Constants.gunmetal), lineWidth: 1))
                    .offset(x: -230, y: -30)
                    
                    
                }
                    // challenge description
                    Text(feedObject.challenge.description)
                            .font(.custom("Helvetica Neue", size: 9))
                        .foregroundColor(Color(Constants.gunmetal))
                         .padding(EdgeInsets(top:10, leading: 50, bottom: 0, trailing: 50))
                        .frame(idealHeight: 80, maxHeight: 100)
                
                
                // like button
                VStack {
                    Button(action: {
                        self.plantImg = self.determineLikeSprite()
                    }) {
                            Image(getPlantImg())
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26, height: 26)
                        
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: -130, y: 41)
                    Text("\(self.getNumerOfLikes()) likes")
                        .font(.custom("Helvetica Neue", size: 6))
                        .foregroundColor(Color(Constants.gunmetal))
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
                RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                    .fill(Color(Constants.ufoGreen))
                               .frame(width: 201, height: 17)
                    .offset(y: -140)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 100))
                .overlay(
                    ZStack {
                            RoundedRectangle(cornerRadius: cornerR, style: .continuous)
                                .stroke(Color(Constants.gunmetal), lineWidth: 1)
                            .offset(x: -45, y: -140)
                            .frame(width: 201, height: 17)
                        HStack {
                            Button(action: {
                                self.visitUserPage()
                            }) {
                                Text(feedObject.user.name)
                                .font(.custom("Helvetica Neue", size: 12))
                                    .foregroundColor(Color(Constants.whiteSmoke))
                            }
                            Text("completed a challenge")
                            .font(.custom("Helvetica Neue", size: 12))
                                .foregroundColor(Color(Constants.gunmetal))
                        }.offset(x: -60, y: -140)
                            .frame(alignment: .leading)
                    }
                    
                )
            }
    }
    
    func visitUserPage() -> Void {
        print("Username Tapped!")
    }
    
    func textBasedOnFeedType() -> String {
        return "completed a challenge"
    }
    
     func determineLikeSprite() -> String {
        if(plantImg == "plant-unselected") {
            print("selected")
            return "plant-selected"
        } else if (plantImg == "plant-selected") {
            print("deselected")
            return "plant-unselected"
        } else {
            print("selected")
            return "plant-unselected"
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
    
    func visitChallengePage() -> Void {
        print ("Visiting challenge page")
    }
}

struct FeedObjectView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let user = User(userImage: Image(systemName: "house"), id: "1", name: "Levi", bio: "hello", activeChallenges: [], previousChallenges: [], followers: [], following: []);
        
        let challenge = Challenge(id: "2", name: "challenge 1", iconImage:Image(systemName: "house"), vibe: Vibe.water, description: "Grab a shovel and get digging! You can find saplings at hardware stores or anywhere that sells trees. Make it a goal to plant one every month and soon you’ll have a whole grove!", threshold: 1, challengeUsers: []);
        let feedObject2 = FeedObject(id: "3", user: user, challenge: challenge, likes: [], feedType: FeedType.created, date: Date());
        
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
