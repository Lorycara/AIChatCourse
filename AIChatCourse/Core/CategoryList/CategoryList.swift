//
//  CategoryList.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 14/01/25.
//

import SwiftUI

struct CategoryList: View {
    
    var category: CharacterOption = .alien
    var imageName: String = Constants.randomImage
    @State private var avatars: [AvatarModel] = AvatarModel.mocks
    
    @Binding var path: [NavigationPathOption]
    
    var body: some View {
        List {
                imageCell
                
                categoriesSection
        }
        .listStyle(PlainListStyle())
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    CategoryList( path: .constant([]))
}

// MARK: COMPONENTS
extension CategoryList {
    private var imageCell: some View {
        ImageLoaderView(urlString: imageName)
            .readableImage()
            .frame( height: 400)
            .overlay(alignment: .bottomLeading) {
                Text(category.plural.capitalized)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
            }
            .removeListRowFormatting()

    }
    
    private var categoriesSection: some View {
            Section {
                ForEach(avatars, id: \.self) { avatar in
                    CustomListCellView(avatar: avatar)
                        .anyButtonStyle {
                            onAvatarPressed(avatar: avatar)
                        }
                }
            }
            .removeListRowFormatting()
    }
}

// MARK: LOGIC
extension CategoryList {
    private func onAvatarPressed(avatar: AvatarModel){
        let newOption = NavigationPathOption.chat(avatarId: avatar.avatarID)
        path.append(newOption)
    }
}
