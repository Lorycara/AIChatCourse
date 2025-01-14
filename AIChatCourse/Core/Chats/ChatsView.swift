//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct ChatsView: View {
    @State var chats: [ChatModel] = ChatModel.mocks /*[]*/
    @State var recentAvatars: [AvatarModel] = AvatarModel.mocks /*[]*/
    
    @State private var path: [NavigationPathOption] = []

    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                recentsSection
                chatsSection
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }
}

#Preview {
    ChatsView()
}

// MARK: COMPONENTS
extension ChatsView {
    private var recentsSection: some View {
        Section{
            if recentAvatars.isEmpty {
                Text("Your recents chats will appear here")
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(recentAvatars, id: \.self) { avatar in
                            RecentChatView(imageName: avatar.profileImageName ?? "", title: avatar.name ?? "")
                                .anyButtonStyle(.plain) {
                                    onAvatarPressed(avatarId: avatar.avatarID)
                                }
                        }
                    }
                    .padding(.top, 10)
                }
                .removeListRowFormatting()
                .scrollIndicators(.hidden)
            }
        } header: {
            Text("Recents")
        }
    }
    
    private var chatsSection: some View{
        Section {
            if chats.isEmpty {
                Text("Your chats will appear here")
                    .removeListFormatting()
                    .padding(30)
                    .foregroundStyle(Color.secondary)
                    .font(.title3)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .multilineTextAlignment(.center)
            } else {
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
            
        } header: {
            Text("Chats")
        }
    }
}


// MARK: LOGIC
extension ChatsView {
    private func onAvatarPressed(avatarId: String){
        let newOption = NavigationPathOption.chat(avatarId: avatarId)
        path.append(newOption)
    }
}
