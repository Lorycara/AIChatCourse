//
//  WelcomeView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct WelcomeView: View {
    @State var imageName = Constants.randomImage
    
    @State var showCreateAccountView: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: 13) {
                    titleSection
                    
                    getStartedButton
                    
                    accountButtonSection
                    
                    policyLinksSection
                }
                .padding(16)
            }
            .ignoresSafeArea()
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView(logOption: .signIn)
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppState())
    
}

extension WelcomeView {
    // MARK: TITLE
    private var titleSection: some View {
        VStack(spacing: 13) {
            Text("Ai Chat 🤙🏻")
                .font(.system(.largeTitle, design: .default, weight: .semibold))
            Text("Loricara")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
    
    // MARK: Button
    private var getStartedButton: some View {
        NavigationLink {
            // finish on boasrding and enter onboarding completed
            OnBoardingIntroView()
        } label: {
            Text("Get Started")
                .asCallToActionButton()
        }
        .padding(.vertical, 8)

    }
    
    private var accountButtonSection: some View {
            Text("Already have an account= Sign in.")
                .underline()
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    showCreateAccountView.toggle()
                }
    }
    
    private var policyLinksSection: some View {
        HStack(spacing: 0) {
            Link(destination: URL(string: "https://www.google.com")!) {
                Text("Terms of service")
                    .font(.callout)
                    .padding()
                    .foregroundStyle(.accent)
            }
            Circle()
                .frame(width: 4, height: 4)
                .foregroundStyle(.accent)
            Link(destination: URL(string: "https://www.apple.com")!) {
                Text("Privacy Policy")
                    .font(.callout)
                    .padding()
                    .foregroundStyle(.accent)
            }
        }
    }
}
