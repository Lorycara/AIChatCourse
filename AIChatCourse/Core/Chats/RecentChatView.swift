//
//  RecentChatView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 14/01/25.
//

import SwiftUI

struct RecentChatView: View {
    var imageName: String = Constants.randomImage
    var title: String = "Recent Chat"
    
    var body: some View {
        VStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: 90, height: 90)
                .clipShape(.circle)
            Text(title)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    RecentChatView()
}
