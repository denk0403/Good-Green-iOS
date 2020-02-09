//
//  FeedObjectLikeButtonView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct FeedObjectLikeButtonView: View {
    @State private var plantImg = "plant-selected"
    
    var body: some View {
        VStack {
            Button(action: {
                self.plantImg = self.determineLikeSprite()
            }) {
                    Image(getPlantImg())
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                
                }.buttonStyle(PlainButtonStyle())
                .buttonStyle(PlainButtonStyle())
            Text("\(self.getNumerOfLikes()) likes")
                .font(.custom("Helvetica Neue", size: 6))
                .foregroundColor(Color(Constants.gunmetal))
                .frame(width: 25)
        }
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
    
    
    func getPlantImg() -> String {
        return plantImg
    }
    
    func getNumerOfLikes() -> Int {
        // TO-DO
        return 11
    }
    
}

struct FeedObjectLikeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FeedObjectLikeButtonView()
    }
}
