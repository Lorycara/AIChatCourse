//
//  OnBoardingCompletedView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct OnBoardingCompletedView: View {
    @Environment(AppState.self) private var root
    var body: some View {
        VStack {
            Text("Welcome")
                .frame(maxHeight: .infinity)
            
            Button {
                onFinishButtonTapped()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }
    
    private func onFinishButtonTapped() {
        // logic to complete boarding
        
        root.updateViewState(showTabBarView: true)
        print(root.showTabBar)
    }
}

#Preview {
    OnBoardingCompletedView()
        .environment(AppState())
}

