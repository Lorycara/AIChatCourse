//
//  AppView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 09/01/25.
//

import SwiftUI

// tabbar - signed in
// on boarding - signed out

struct AppView: View {
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabBarView: {
                Color.red.ignoresSafeArea(.all)
            },
            onBoardingView: {
                Color.blue.ignoresSafeArea(.all)
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview("AppView - TabBar") {
    AppView(showTabBar: true)
}
#Preview("AppView - OnBoarding") {
    AppView(showTabBar: false)
}
