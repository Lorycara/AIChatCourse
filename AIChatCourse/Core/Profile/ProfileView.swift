//
//  ProfileView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct ProfileView: View {
    @State var showSettingsView: Bool = false
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
        }
        .sheet(isPresented: Binding(get: {
            (showSettingsView && appState.showTabBar)
        }, set: {showSettingsView = $0}) ) {
            SettingsView()
        }
    }
    
    private var settingsButton: some View {
        
        Image(systemName: "gear")
            .foregroundStyle(.accent)
            .onTapGesture {
                onSettingsButtonPressed()
            }
    }
    
    private func onSettingsButtonPressed() {
        showSettingsView.toggle()
    }
}

#Preview {
    ProfileView()
}
