//
//  UserModel.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import Foundation
import SwiftUI

struct UserModel{
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHex else { return .accent }
        return Color(hex: profileColorHex)
    }
}
// MARK: MOCK

extension UserModel {
    static var mock: Self {
        UserModel(
            userId: UUID().uuidString,
            dateCreated: Date().addingDateInterval(days: -7), // Created 7 days ago
            didCompleteOnboarding: true,
            profileColorHex: "#3498DB" // A bright orange-red color
        )
    }
    
    static var mocks: [Self] {
        [
            UserModel(
                userId: UUID().uuidString,
                dateCreated: Date().addingDateInterval(days: -14), // Created 14 days ago
                didCompleteOnboarding: true,
                profileColorHex: "#FF5733" // A calming blue
            ),
            UserModel(
                userId: UUID().uuidString,
                dateCreated: Date().addingDateInterval(days: -30), // Created 30 days ago
                didCompleteOnboarding: false,
                profileColorHex: "#2ECC71" // A vibrant green
            ),
            UserModel(
                userId: UUID().uuidString,
                dateCreated: Date().addingDateInterval(days: -1), // Created yesterday
                didCompleteOnboarding: true,
                profileColorHex: "#9B59B6" // A bold purple
            ),
            UserModel(
                userId: UUID().uuidString,
                dateCreated: Date().addingDateInterval(days: -90), // Created 90 days ago
                didCompleteOnboarding: false,
                profileColorHex: "#E74C3C" // A striking red
            )
        ]
    }
}
