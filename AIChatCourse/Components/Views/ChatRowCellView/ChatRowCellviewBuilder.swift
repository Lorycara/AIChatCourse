//
//  CustomoRowCellviewBuilder.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    var currentUserId: String?
    var chat: ChatModel = .mock
    var getAvatar: () async -> (AvatarModel)?
    var getMessages: () async -> (ChatMessageModel)?
    
    @State private var avatar: AvatarModel?
    @State private var lastMessage: ChatMessageModel?
    
    @State private var didLoadAvatar: Bool = false
    @State private var didLoadLastMessage: Bool = false
    
    private var isLoading: Bool {
        !(didLoadAvatar && didLoadLastMessage)
    }
    
    private var subheadline: String {
        if isLoading {
            return "xxxx xxxxx xxxxxx xxxxx"
        } else if avatar == nil && lastMessage == nil {
            return "error"
        }
    
        return lastMessage?.content ?? ""
        
    }
    
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxx xxxxx xxxxx" : avatar?.name,
            subheadline: isLoading ? "xxxx xxxxx xxxxxx xxxxx" : lastMessage?.content,
            hasNewChat: lastMessage?.hasBeenSeenBy(userId: currentUserId ?? "") ?? false
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastMessage = await getMessages()
            didLoadLastMessage = true
        }
    }
    
    private var hasNewChat: Bool {
        lastMessage?.hasBeenSeenBy(userId: currentUserId ?? "") ?? false
    }
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: ChatModel.mock) {
            try? await Task.sleep(for: .seconds(1))
            return .mock
        } getMessages: {
            return ChatMessageModel.mock
        }
        
        ChatRowCellViewBuilder(chat: ChatModel.mock) {
            return .mock
        } getMessages: {
            return ChatMessageModel.mock
        }
        
        ChatRowCellViewBuilder(chat: ChatModel.mock) {
            return .mock
        } getMessages: {
            try? await Task.sleep(for: .seconds(2))
            return ChatMessageModel.mock
        }
        
        ChatRowCellViewBuilder(chat: ChatModel.mock) {
            return nil
        } getMessages: {
            return nil
        }
    }
}
