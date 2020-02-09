//
//  ChallengeCreationHeaderView.swift
//  Good Green
//
//  Created by Levi Kaplan on 2/9/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ChallengeCreationHeaderView: View {
    @Binding var selectedVibe: Int
    
    var body: some View {
        HStack {
            VStack {
                SelectVibeButton(selectedVibe: self.$selectedVibe)
            }
        }
            
    }
}

//struct ChallengeCreationHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChallengeCreationHeaderView()
//    }
//}
