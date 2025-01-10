//
//  OnBoardingColorView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct OnBoardingColorView: View {
    let profileColors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan, .gray, .black, .teal, .brown]
    @State var selectedColor: Color?
    
    var body: some View {
        scrollColorsSection
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            spacing: 16,
            content: {
                if selectedColor != nil {
                    ZStack {
                        ctaButton
                    }
                    .padding(.vertical, 16)
                    .background(Color(uiColor: .systemBackground))
                }
            }
        )
        .animation(.bouncy, value: selectedColor)
        .padding(.horizontal, 24)
        
    }
}

#Preview {
    OnBoardingColorView()
}

extension OnBoardingColorView {
    private var scrollColorsSection: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: 3),
                alignment: .center,
                spacing: 16,
                pinnedViews: [.sectionHeaders],
                content: {
                    circleColorsSection
                }
            )
            .animation(.smooth, value: selectedColor)
        }
    }
    private var circleColorsSection: some View {
        Section {
            ForEach(profileColors, id: \.self) { color in
                Circle()
                    .fill(.accent)
                    .overlay {
                        Circle()
                            .fill(color)
                            .padding(selectedColor == color ? 10 : 0)
                    }
                    .onTapGesture {
                        selectedColor = color
                    }
                
            }
        } header: {
            Text("Select a profile color")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
        }
    }
    
    private var ctaButton: some View {
        NavigationLink {
            OnBoardingCompletedView()
        } label: {
            Text("Continue")
                .asCallToActionButton()
        }
    }
}
