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
    

    
    @State private var isLoading = true
    

    
   
    var body: some View {
        VStack() {
            // main body showing challenge, icon, and description
            ZStack {
               FeedObjectBackgroundRectView()
                
               
                    VStack(alignment: .leading) {
						NavigationLink(destination: ChallengePageView(challenge: self.feedObject.challenge)) {
                        FeedObjectChallengeHeadingView(feedObject: feedObject)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        }
                        // challenge description
                        FeedObjectBodyView(feedObject: feedObject)
                        
                        FeedObjectLikeButtonView(feedObject: feedObject)
                    }
                FeedObjectUserOverlayView(feedObject: feedObject)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 135, trailing: 70))
                        }
                    

        }.frame(width: 320, height: 125)
    }
    
   
    
    func textBasedOnFeedType() -> String {
        return "completed a challenge"
    }
    
    func visitChallengePage() -> Void {
        print ("Visiting challenge page")
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
