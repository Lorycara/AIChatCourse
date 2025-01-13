//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct ChatsView: View {
    @State var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add cuid
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getMessages: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        }
                    )
                    .anyButtonStyle(.highlight, action: {
                        
                    })
                    .removeListRowFormatting()
                }
            }
            .navigationTitle("ciai")
        }
    }
}

#Preview {
    ChatsView(chats: ChatModel.mocks)
}

