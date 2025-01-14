//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct ChatsView: View {
    @State var chats: [ChatModel] = ChatModel.mocks
    
    @State private var path: [NavigationPathOption] = []

    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // Add cuid
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mocks.randomElement()
                        },
                        getMessages: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mocks.randomElement()
                        }
                    )
                    .anyButtonStyle(.highlight, action: {
                        onAvatarPressed(avatarId: chat.avatarId)
                    })
                    .removeListRowFormatting()
                }
            }
            .navigationTitle("ciai")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
}

#Preview {
    ChatsView(chats: ChatModel.mocks)
}


extension ChatsView {
    private func onAvatarPressed(avatarId: String){
        let newOption = NavigationPathOption.chat(avatarId: avatarId)
        path.append(newOption)
    }
    
}
