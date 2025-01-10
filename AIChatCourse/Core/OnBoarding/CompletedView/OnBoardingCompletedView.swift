//
//  OnBoardingCompletedView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct OnBoardingCompletedView: View {
    @Environment(AppState.self) private var root
    var selectedColor: Color
    @State private var isCompletingProfileSetup: Bool = false

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Setup Complete!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(selectedColor)
                Text("We've set up your profile and you're ready to start chatting")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .padding(.vertical, 1)
            }
            .padding(20)
            .frame(maxHeight: .infinity)
            
            ctaButton
        }
        .animation(.bouncy, value: isCompletingProfileSetup)
        .padding(16)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func onFinishButtonTapped() {
        // logic to complete boarding
        // saveUserProfile(selectedcolor
        
        Task {
            isCompletingProfileSetup = true
            try? await Task.sleep(for: .seconds(3))
            
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnBoardingCompletedView(selectedColor: .green)
        .environment(AppState())
}

extension OnBoardingCompletedView {
    private var ctaButton: some View {
        Button {
            onFinishButtonTapped()
        } label: {
            if isCompletingProfileSetup {
                ProgressView()
                    .tint(selectedColor)
                    .asCallToActionButton()
            } else {
                Text("Finish")
                    .asCallToActionButton()
            }
        }
        .disabled(isCompletingProfileSetup)
    }
}
