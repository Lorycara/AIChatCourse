//
//  AvatarDescriptionBuilder.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//
import Foundation

// MARK: ENUMS
enum CharacterOption: String, CaseIterable, Hashable, Codable {
    case man, woman, alien, dog, cat
    
    static var `default`: Self { .man }
    
    var startsWithAVowel: Bool {
        switch self {
        case .alien:
            return true
        default:
            return false
        }
    }
}

enum CharacterAction: String, CaseIterable, Hashable, Codable {
    case smiling, sitting, eating, drinking, walking, shopping, studying, sleeping, dancing, playing, relaxing, fighting, crying
    
    static var `default`: Self { .smiling }
}

enum CharacterLocation: String, CaseIterable, Hashable, Codable {
    case home, work, school, hospital, library, park, mall, museum, city, desert, forest, space
    
    static var `default`: Self { .home }
}

// MARK: DESCRIPTION BUILDER
struct DescriptionBuilder {
    var characterOption: CharacterOption
    var characterAction: CharacterAction
    var characterLocation: CharacterLocation
    
    var characterDescription: String {
        let prefix = characterOption.startsWithAVowel ? "An" : "A"
        return "\(prefix) \(characterOption.rawValue) who is \(characterAction.rawValue) in the \(characterLocation.rawValue)"
    }
    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }
    
    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }
}
