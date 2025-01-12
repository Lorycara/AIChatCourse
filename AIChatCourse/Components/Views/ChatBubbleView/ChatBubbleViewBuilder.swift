//
//  ChatBubbleViewBuilder.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var avatarImageName: String?
    
    var body: some View {
        
        ChatBubbleView(text: message.content ?? "", imageName: avatarImageName ?? "", isCurrentUser: isCurrentUser)
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
            .padding(.leading, isCurrentUser ? 75 : 0)
            .padding(.trailing, isCurrentUser ? 0 : 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24){
            ChatBubbleViewBuilder(message: ChatMessageModel.mocks[1], isCurrentUser: true, avatarImageName: Constants.randomImage)
            ChatBubbleViewBuilder(message: ChatMessageModel.mock, isCurrentUser: false, avatarImageName: Constants.randomImage)
            ChatBubbleViewBuilder(message: ChatMessageModel.mock, isCurrentUser: false, avatarImageName: Constants.randomImage)
        }
        .padding()
    }
}
