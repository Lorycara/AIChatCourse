//
//  AppView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 09/01/25.
//

import SwiftUI

struct AppView: View {
    @State var appState: AppState = .init()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabBarView: {
                TabBarView()
            },
            onBoardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
        .onAppear(){
            print(appState.showTabBar)
        }
    }
}

#Preview("AppView - TabBar") {
    AppView(appState: .init(showTabBar: true))
}
#Preview("AppView - OnBoarding") {
    AppView(appState: .init(showTabBar: false))
}
