//
//  ProfileModalsView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 13/01/25.
//

import SwiftUI

struct ProfileModalsView: View {
    var imageName: String = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "alien"
    var headline: String? = "An alien int he park"
    var onXmarkPressed: (() -> Void)?
    
    var body: some View {
        VStack {
            ImageLoaderView(urlString: imageName, forceTransitionAnimation: true)
                .frame(height: 325)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(title ?? "")
                    .font(.title)
                    .bold(true)
                    .padding(.bottom, 10)
                    .foregroundStyle(.black)
                    
                Text(subtitle ?? "")
                    .font(.title3)
                    .padding(.bottom, 5)
                    .foregroundStyle(.secondary)
                
                Text(headline ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(25)
        .overlay(alignment: .topTrailing) {
            Image(systemName: "xmark.circle.fill")
                .padding(5)
                .font(.title)
                .padding(10)
                .tappableBackground()
                .anyButtonStyle(.plain) {
                    onXmarkPressed?()
                }
        }
    }
}

#Preview {
    ProfileModalsView()
        .padding(40)
}
