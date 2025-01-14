//
//  ExploreVie.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct ExploreView: View {
    @State var avatars: [AvatarModel] = [] // why?
    @State var categories: [CharacterOption] = CharacterOption.allCases
    @State var popularAvatars: [AvatarModel] = []
    
    @State private var path: [NavigationPathOption] = []
    
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                List {
                    featuredAvatarsSection
                    categoriesSection
                    popularSection
                }
            }
            .navigationTitle("Explore")
            .navigationDestinationForCoreModule(path: $path)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "bell.fill")
                        .foregroundStyle(.accent)
                }
            }
        }
        .task {
            getData()
        }
    }
    
}

#Preview {
    let avatars: [AvatarModel] = AvatarModel.mocks  // why?

    ExploreView()
//    CarouselView(avatars: avatars, content: {HeroCellView(avatar: $0)})
    
}
// MARK: LOGIC
private extension ExploreView {
    private func getData() {
        avatars = AvatarModel.mocks
        popularAvatars = Array(AvatarModel.mocks.prefix(upTo: 5))
    }
}

// MARK: COMPONENTS
extension ExploreView {
    private var featuredAvatarsSection: some View {
        Section {
            ZStack {
                CarouselView(avatars: avatars, content: { avatar in
                    HeroCellView(avatar: avatar)
                        .anyButtonStyle(.plain) {
                            onAvatarPressed(avatar: avatar)
                        }})
            }
            .removeListFormatting()

        } header: {
            Text("FEATURED AVATARS")
        }
    }
    
    private var categoriesSection: some View {
        Section {
            ZStack {
                CategoryCarouselView(images: Array(repeating: Constants.randomImage, count: categories.count), categories: categories, onCellPressed: { category in
                    let imageName = popularAvatars.first(where: { $0.characterOption == category})
                    onCategoryPressed(category: category, imageName: imageName?.profileImageName ?? "")
                })
                    .frame(height: 150)
            }
            .removeListFormatting()

        } header: {
            Text("Categories")
        }
    }
    
    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(avatar: avatar)
                    .anyButtonStyle(.highlight) {
                        onAvatarPressed(avatar: avatar)
                    }
                    .removeListFormatting()
            }
        } header: {
            Text("Popular")
        }
    }
}

// MARK: LOGIC

extension ExploreView {
    private func onAvatarPressed(avatar: AvatarModel){
        let newOption = NavigationPathOption.chat(avatarId: avatar.avatarID)
        path.append(newOption)
    }
    
    private func onCategoryPressed(category: CharacterOption, imageName: String){
        let newOption = NavigationPathOption.category(category: category, imageName: imageName)
        path.append(newOption)
    }
}
