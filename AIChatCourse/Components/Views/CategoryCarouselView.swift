//
//  CategoryCarouselView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 11/01/25.
//

import SwiftUI

struct CategoryCarouselView: View {
    var images: [String]
    var categories: [CharacterOption]
    var onCellPressed: ((CharacterOption) -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(categories.indices, id: \.self) { index in
                    HeroCellView(title: categories[index].plural.capitalized, imageName: images[index])
                        .frame(width: 140, height: 140)
                        .anyButtonStyle(.plain) {
                            onCellPressed?(categories[index])
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    CategoryCarouselView(images: Array(repeating: Constants.randomImage, count: CharacterOption.allCases.count), categories: CharacterOption.allCases)
        .frame(height: 150)
}
