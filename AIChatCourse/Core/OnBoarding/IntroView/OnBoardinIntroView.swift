//
//  OnBoardinIntroView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct OnBoardingIntroView: View {
    var body: some View {
        VStack {
            VStack {
                firstText
            
                secondText
                
            }
            .frame(maxHeight: .infinity)
            
            continueButton
        }
        .toolbar(.hidden, for: .navigationBar)
        .padding(16)
    }
    
}

#Preview {
    NavigationStack {
        OnBoardingIntroView()
    }
    .environment(AppState())

}

extension OnBoardingIntroView {
    private var firstText: some View {
        Group {
            Text("Make your own ")
            +
            Text("avatars ")
                .foregroundStyle(.accent)
                .fontWeight(.semibold)
            +
            Text("and chat with them!")
        }
        .font(.title3)
        .padding(10)
    }
    private var secondText: some View {
        Group {
            Text("Have ")
            +
            Text("real conversations ")
                .foregroundStyle(.accent)
                .fontWeight(.semibold)
            +
            Text("with AI generated responses")
        }
        .font(.title3)
        .padding(10)
    }
    private var continueButton: some View {
        NavigationLink {
            OnBoardingColorView()
        } label: {
            Text("Continue")
                .asCallToActionButton()
        }
    }
}
