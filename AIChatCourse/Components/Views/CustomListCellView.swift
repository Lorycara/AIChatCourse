//
//  CustomListCellView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 11/01/25.
//

import SwiftUI

struct CustomListCellView: View {
    var urlString: String?
    var title: String?
    var subtitle: String?
        
    init(urlString: String? = nil, title: String? = nil, subtitle: String? = nil) {
        self.urlString = urlString
        self.title = title
        self.subtitle = subtitle
    }
    init(avatar: AvatarModel? = nil ) {
        self.urlString = avatar?.profileImageName
        self.title = avatar?.name
        self.subtitle = avatar?.characterDescription
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ImageLoaderView(urlString: urlString ?? "")
                .cornerRadius(15)
                .frame(width: 70, height: 70)
                
            VStack(alignment: .leading) {
                Text(title ?? "")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(subtitle ?? "")
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
