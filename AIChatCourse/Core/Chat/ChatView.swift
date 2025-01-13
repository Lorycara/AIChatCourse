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
    @State private var currentUser: UserModel? = UserModel.mock
    @State private var userTextField: String = ""
    @State private var showChatSettings: Bool = false
    
    var body: some View {
        VStack {
            scrollMessagesSection
            
            textFieldSection
        }
        .animation(.default, value: userTextField)
        .animation(.default, value: chatMessages)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .anyButtonStyle(.plain) {
                        showChatSettings.toggle()
                    }
            }
        }
        .confirmationDialog("What would you like to do?", isPresented: $showChatSettings) {
            Button("Delete Chat", role: .destructive){
                
            }
            Button("Report User / Chat", role: .destructive){
                
            }
        } message: {
            Text("What would you like to do?")
        }

    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
// MARK: COMPONENTS
extension ChatView {
    private var sendButton: some View {
        Image(systemName: "arrow.up.circle.fill")
            .resizable()
            .foregroundStyle(.accent)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .anyButtonStyle(.plain) {
                onSendButtonPressed()
            }
    }
    
    private var scrollMessagesSection: some View {
        ScrollView {
            chatListSection
                .rotationEffect(.degrees(180))

        }
        .rotationEffect(.degrees(180))
        .padding(8)
        .navigationTitle(avatar.name ?? "")
        .toolbarTitleDisplayMode(.inline)
    }
    
    private var chatListSection: some View {
        LazyVStack(spacing: 10) {
            ForEach(chatMessages) { message in
                let isCurrentUser = message.authorId == currentUser?.userId
                ChatBubbleViewBuilder(message: message, isCurrentUser: isCurrentUser, avatarImageName: isCurrentUser ? nil : avatar.profileImageName)
            }
        }
    }
    
    private var textFieldSection: some View {
        TextField(text: $userTextField) {
            Text("Say something..")
        }
        .onSubmit(onSendButtonPressed)
        .keyboardType(.alphabet)
        .autocorrectionDisabled()
        .padding(.trailing, 60)
        .padding(10)
        .overlay(alignment: .trailing, content: {
            sendButton
        })
        .padding(4)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color(UIColor.systemBackground))
                
                RoundedRectangle(cornerRadius: 100)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            }
        )
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
    }
}

// MARK: LOGIC
extension ChatView {
    private func onSendButtonPressed() {
        guard let currentUser else { return }
        let message = ChatMessageModel(id: UUID().uuidString, chatId: UUID().uuidString, authorId: currentUser.userId, content: userTextField, seenByIds: nil, dateCreated: .now)
        chatMessages.append(message)
        userTextField = ""
    }
}
