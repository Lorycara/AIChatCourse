//
//  SettingsView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutButtonpressed()
                } label: {
                    Text("Sign Out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    private func onSignOutButtonpressed() {
        //LOGIC to sign out
        appState.updateViewState(showTabBarView: false)
    }
}

#Preview {
    SettingsView()
}
