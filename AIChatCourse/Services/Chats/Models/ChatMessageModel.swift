//
//  Untitled.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//
import Foundation

struct ChatMessageModel{
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenBy: [String]?
    let dateCreated: Date?
    
    init(id: String, chatId: String, authorId: String? = nil, content: String? = nil, seenBy: [String]? = nil, dateCreated: Date? = nil) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenBy = seenBy
        self.dateCreated = dateCreated
    }
}

// MARK: MOCK

extension ChatMessageModel {
    static var mock: ChatMessageModel {
        ChatMessageModel(
            id: UUID().uuidString,
            chatId: "chat_001",
            authorId: "user_123",
            content: "Hello, how are you?",
            seenBy: ["user_456", "user_789"],
            dateCreated: Date().addingDateInterval(days: -1, hours: -2) // 1 day and 2 hours ago
        )
    }
    
    static var mocks: [ChatMessageModel] {
        [
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_001",
                authorId: "user_001",
                content: "Hey, what's up?",
                seenBy: ["user_002", "user_003"],
                dateCreated: Date().addingDateInterval(days: -1, hours: -3) // 1 day, 3 hours ago
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_002",
                authorId: "user_004",
                content: "Can we meet tomorrow?",
                seenBy: ["user_005"],
                dateCreated: Date().addingDateInterval(days: -2) // 2 days ago
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_003",
                authorId: "user_006",
                content: "Don't forget about the meeting.",
                seenBy: ["user_007", "user_008", "user_009"],
                dateCreated: Date().addingDateInterval(hours: -5) // 5 hours ago
            ),
            ChatMessageModel(
                id: UUID().uuidString,
                chatId: "chat_004",
                authorId: nil, // System message
                content: "Welcome to the group chat!",
                seenBy: nil,
                dateCreated: Date().addingDateInterval(minutes: -30) // 30 minutes ago
            )
        ]
    }
}
