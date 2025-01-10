//
//  AppViewBuilder.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//
import SwiftUI

struct AppViewBuilder<TabBarView: View, OnBoardingView: View>: View {
    var showTabBar: Bool
    
    @ViewBuilder var tabBarView: TabBarView
    @ViewBuilder var onBoardingView: OnBoardingView
    var body: some View {
        ZStack {
            if showTabBar {
                tabBarView
            } else {
                onBoardingView
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct PreviewView: View {
    @State private var showTabBar: Bool = false
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

#Preview(body: {
    PreviewView()
})
