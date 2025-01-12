//
//  ChatModel.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 11/01/25.
//
import Foundation

struct ChatModel: Hashable, Identifiable, Codable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
    
}

// MARK: MOCK

extension ChatModel {
    static var mock: ChatModel {
        ChatModel(
            id: UUID().uuidString,
            userId: "user_123",
            avatarId: "avatar_456",
            dateCreated: Date(),
            dateModified: Date().addingDateInterval(hours: -1)
        )
    }
    
    static var mocks: [ChatModel] {
        [
            ChatModel(
                id: UUID().uuidString,
                userId: "user_001",
                avatarId: "avatar_101",
                dateCreated: Date().addingDateInterval(days: -1),  // 1 day ago
                dateModified: Date().addingDateInterval(days: -1, hours: -1)  // 1 day, 1 hour ago
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "user_002",
                avatarId: "avatar_102",
                dateCreated: Date().addingDateInterval(days: -2),  // 2 days ago
                dateModified: Date().addingDateInterval(days: -2, hours: -2)  // 2 days, 2 hours ago
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "user_003",
                avatarId: "avatar_103",
                dateCreated: Date().addingDateInterval(days: -3),  // 3 days ago
                dateModified: Date().addingDateInterval(days: -3, hours: -3)  // 3 days, 3 hours ago
            ),
            ChatModel(
                id: UUID().uuidString,
                userId: "user_004",
                avatarId: "avatar_104",
                dateCreated: Date().addingDateInterval(days: -4),  // 4 days ago
                dateModified: Date().addingDateInterval(days: -4, hours: -4)  // 4 days, 4 hours ago
            )
        ]
    }
}
