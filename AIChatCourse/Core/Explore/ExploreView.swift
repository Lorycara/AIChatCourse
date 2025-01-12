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
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    featuredAvatarsSection
                    categoriesSection
                    popularSection
                }
            }
            .navigationTitle("Explore")
        }
        .task {
            getData()
        }
    }
    
}

#Preview {
    let avatars: [AvatarModel] = AvatarModel.mocks  //why?

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
                CarouselView(avatars: avatars, content: {HeroCellView(avatar: $0)
                        .anyButtonStyle(.plain) {}})
            }
            .removeListFormatting()

        } header: {
            Text("FEATURED AVATARS")
        }
    }
    
    private var categoriesSection: some View {
        Section {
            ZStack {
                CategoryCarouselView(images: Array(repeating: Constants.randomImage, count: categories.count), categories: categories)
                    .frame(height: 150)
                    .anyButtonStyle {
                        
                    }
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
                        print("patataatatat")
                    }
                    .removeListFormatting()
            }
        } header: {
            Text("Popular")
        }
    }
}
