//
//  ChatRowCellView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct ChatRowCellView: View {
    var imageName: String?
    var headline: String?
    var subheadline: String?
    var hasNewChat: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        
                } else {
                    Rectangle()
                        .fill(Color.secondary)
                }
            }
            .frame(width: 60, height: 60)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(headline ?? "")
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Text(subheadline ?? "")
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .padding(8)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    List {
        ChatRowCellView(imageName: Constants.randomImage, headline: "Aphia", subheadline: "Hey!")
            .removeListFormatting()

        ChatRowCellView(imageName: Constants.randomImage, headline: "Aphia", subheadline: "Hey!", hasNewChat: true)
            .removeListFormatting()
        ChatRowCellView(headline: "Aphia", subheadline: "Hey!", hasNewChat: true)
            .removeListFormatting()
    }
}
