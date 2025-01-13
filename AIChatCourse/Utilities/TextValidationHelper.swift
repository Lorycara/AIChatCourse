//
//  TextValidationHelper.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 13/01/25.
//

import Foundation
import SwiftUI

// MARK: LOGIC
struct TextValidationHelper {
    
    static func checkTexfIsValid(text: String) throws {
        // Minimum length
        let minimumCharacterCount = 2
        
        guard text.count >= minimumCharacterCount else { throw TextValidationError.notEnoughCharacters(min: minimumCharacterCount) }
        
        // Bad words
        let badWords = [
            "shit", "whore", "bitch"
        ]
        
        var doesContain: Bool = false
        
        badWords.map { text.lowercased().contains($0.lowercased())}.forEach {
            if $0 { doesContain = true}
        }
        
        guard doesContain == false else { throw TextValidationError.badWords}
    }
}

// MARK: Enum
enum TextValidationError: LocalizedError {
    case notEnoughCharacters(min: Int)
    case badWords
   
    var errorDescription: String? {
        switch self {
        case .badWords:
            "Bad words detected, please remove them"
        case .notEnoughCharacters(let min):
            "Please put a maximum of \(min) characters"
        }
    }
}
