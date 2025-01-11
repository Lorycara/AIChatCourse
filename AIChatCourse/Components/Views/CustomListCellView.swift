//
//  CustomListCellView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 11/01/25.
//

import SwiftUI

struct CustomListCellView: View {
    var avatar: AvatarModel
    
    var body: some View {
        HStack(alignment: .center) {
            ImageLoaderView(urlString: avatar.profileImageName ?? "")
                .cornerRadius(15)
                .frame(width: 70, height: 70)
                
            VStack(alignment: .leading) {
                Text(avatar.name ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(avatar.characterDescription ?? "")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .tappableBackground()
        .background(Color(UIColor.systemBackground))
        
    }
}

#Preview {
    List {
        Section {
            CustomListCellView(avatar: AvatarModel.mock)
                .anyButtonStyle(.highlight) {}
            CustomListCellView(avatar: AvatarModel.mock)
                .anyButtonStyle {}
        }
    }
//    .scrollContentBackground(.hidden)
}
