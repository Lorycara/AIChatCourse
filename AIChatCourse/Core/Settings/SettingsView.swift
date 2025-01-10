//
//  SettingsView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
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
        // LOGIC to sign out
        
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
        }
        
        appState.updateViewState(showTabBarView: false)
        
    }
}

#Preview {
    SettingsView()
}
