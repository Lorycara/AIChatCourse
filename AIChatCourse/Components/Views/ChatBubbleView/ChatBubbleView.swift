//
//  ChatBubbleView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct ChatBubbleView: View {
    var text: String = "Hello, World!"
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var imageName: String? = Constants.randomImage
    var showImage: Bool = true
    var offSet: CGFloat = 14
    
    var body: some View {
        HStack(alignment: .top) {
            imageSection
            
            contentSection
        }
        .padding(.bottom, showImage ? offSet : 0)
    }
}

#Preview {
    ScrollView {
        VStack(alignment: .leading) {
            ChatBubbleView()
            ChatBubbleView(text: "ajdhijshfiah  khfhefkjhjkfh kjh khds khfhskd hfkjhdsk hf hdas hsfh dhskjhfshfskjfhsk")
            ChatBubbleView(imageName: nil)
            ChatBubbleView(text: "Sium", imageName: Constants.randomImage, isCurrentUser: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: CONVENIENCE INITIALIZER
extension ChatBubbleView {
    init(text: String, imageName: String?, isCurrentUser: Bool) {
        self.text = text
        self.imageName = imageName
        self.backgroundColor = isCurrentUser ? .accent : Color(UIColor.systemGray6)
        self.textColor = isCurrentUser ? .white : .primary
        self.showImage = !isCurrentUser
    }
    
}
// MARK: COMPONENTS

extension ChatBubbleView {
    @ViewBuilder
    private var imageSection: some View {
        if showImage {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                        
                } else{
                    Rectangle()
                        .fill(Color(uiColor: UIColor.systemGray))
                }
            }
            .frame(width: 45, height: 45)
            .clipShape(Circle())
            .offset(y: offSet)
        }
    }
    private var contentSection: some View {
        Text(text)
            .foregroundStyle(textColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
