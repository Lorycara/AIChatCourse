//
//  ExploreVie.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct ExploreView: View {
    let avatar: AvatarModel = AvatarModel.mock // why?
    var body: some View {
        NavigationStack {
            HeroCellView(title: avatar.name, subTitle: avatar.characterDescription, imageName: avatar.profileImageName)
                .frame(height: 200)
                .padding()
        }
    }
}

#Preview {
    ExploreView()
}
