//
//  ChatView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct ChatView: View {
    @State private var avatar: AvatarModel = .mock
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var currentUser: UserModel = UserModel.mock
    
    var body: some View {
            ScrollView {
                chatListSection
            }
        .padding(8)
        .navigationTitle(avatar.name ?? "")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}

extension ChatView {
    private var chatListSection: some View {
        LazyVStack(spacing: 10) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser.userId
                    ChatBubbleViewBuilder(message: message, isCurrentUser: isCurrentUser, avatarImageName: isCurrentUser ? nil : avatar.profileImageName)
                }
            }
        }
}
