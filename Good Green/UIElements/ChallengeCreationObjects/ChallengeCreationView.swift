//
//  ChallengeCreationView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeCreationView: View {
     let iconSize: CGFloat = 100
    var body: some View {
        ZStack {
            Color(Constants.whiteSmoke)
        VStack {
            HStack {
                ChallengeImageView()
                VStack {
                    SetChallengeNameView()
                    SetChallengeDescrView()
                }
                
            }
           
            ChallengeCreationHeaderView()
        }.padding(.bottom, 200)
        }
    }
}

struct ChallengeCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCreationView()
    }
}
