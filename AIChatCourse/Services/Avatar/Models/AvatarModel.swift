//
//  AvatarModel.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//
import Foundation

struct AvatarModel: Codable {
    // parameters
    let avatarID: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?
    var characterDescription: String?{
        DescriptionBuilder.init(avatar: self).characterDescription
    }
    
    // inits
    init(
        avatarID: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarID = avatarID
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
}

// MARK: ENUMS
enum CharacterOption: String, Codable {
    case man, woman, alien, dog, cat
    
    static var `default`: Self { .man }
}

enum CharacterAction: String, Codable {
    case smiling, sitting, eating, drinking, walking, shopping, studying, sleeping, dancing, playing, relaxing, fighting, crying
    
    static var `default`: Self { .smiling }
}

enum CharacterLocation: String, Codable {
    case home, work, school, hospital, library, park, mall, museum, city, desert, forest, space
    
    static var `default`: Self { .home }
}

//MARK: DESCRIPTION BUILDER
struct DescriptionBuilder {
    var characterOption: CharacterOption
    var characterAction: CharacterAction
    var characterLocation: CharacterLocation
    
    var characterDescription: String {
        "A \(characterOption.rawValue) who is \(characterAction.rawValue) in \(characterLocation.rawValue)"
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

// MARK: MOCK
extension AvatarModel {
    
    static var mock: AvatarModel {
        mocks[0]
    }
    
    static let mocks: [AvatarModel] = [
        AvatarModel(
            avatarID: "001",
            name: "John Doe",
            characterOption: .man,
            characterAction: .studying,
            characterLocation: .library,
            profileImageName: Constants.randomImage,
            authorId: "auth123",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "002",
            name: "Jane Smith",
            characterOption: .woman,
            characterAction: .shopping,
            characterLocation: .mall,
            profileImageName: Constants.randomImage,
            authorId: "auth456",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "003",
            name: "Buddy",
            characterOption: .dog,
            characterAction: .relaxing,
            characterLocation: .park,
            profileImageName: Constants.randomImage,
            authorId: "auth789",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "004",
            name: "Mittens",
            characterOption: .cat,
            characterAction: .sleeping,
            characterLocation: .home,
            profileImageName: Constants.randomImage,
            authorId: "auth101",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "005",
            name: "Zorg",
            characterOption: .alien,
            characterAction: .playing,
            characterLocation: .space,
            profileImageName: Constants.randomImage,
            authorId: "auth102",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "006",
            name: "Tom",
            characterOption: .man,
            characterAction: .walking,
            characterLocation: .forest,
            profileImageName: Constants.randomImage,
            authorId: "auth103",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "007",
            name: "Luna",
            characterOption: .woman,
            characterAction: .dancing,
            characterLocation: .museum,
            profileImageName: Constants.randomImage,
            authorId: "auth104",
            dateCreated: Date()
        ),
        AvatarModel(
            avatarID: "008",
            name: "Shadow",
            characterOption: .cat,
            characterAction: .crying,
            characterLocation: .desert,
            profileImageName: Constants.randomImage,
            authorId: "auth105",
            dateCreated: Date()
        )
    ]
}
