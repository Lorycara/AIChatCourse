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
            ForEach(chats) { chat in
                Text(chat.id)
            }
        }
    }
}

#Preview {
    ChatsView(chats: ChatModel.mocks)
}
