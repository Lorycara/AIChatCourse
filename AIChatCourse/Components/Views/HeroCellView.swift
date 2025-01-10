//
//  HeroCellview.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct HeroCellView: View {
    var title: String?
    var subTitle: String?
    var imageName: String?
    
    var body: some View {
        ImageLoaderView(urlString: imageName ?? "")
            .frame(maxWidth: .infinity, alignment: .leading)
            .readableImage()
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text(title?.capitalized ?? "")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(subTitle?.capitalized ?? "")
                }
                .foregroundStyle(.white)
                
                .padding(15)
            }
            .cornerRadius(25)
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack {
            HeroCellView(title: "ciao", subTitle: "Alien smiling in park.", imageName: Constants.randomImage)
                .frame(width: 150, height: 150)
            HeroCellView(title: "ciao", imageName: Constants.randomImage)
                .frame(width: 150, height: 150)
            
            HeroCellView(title: "ciao")
                .frame(width: 150, height: 150)
            HeroCellView(imageName: Constants.randomImage)
                .frame(width: 150, height: 150)
            
            HeroCellView( subTitle: "Alien smiling in park.", imageName: Constants.randomImage)
                .frame(width: 150, height: 150)
        }
        .padding()
    }
}

extension HeroCellView {
    init(title: String, subTitle: String? = nil, imageName: String) {
        self.title = title
        self.subTitle = subTitle
        self.imageName = imageName
    }
    
    init(avatar: AvatarModel){
        self.title = avatar.name
        self.imageName = avatar.profileImageName
        self.subTitle = avatar.characterDescription
    }
}
