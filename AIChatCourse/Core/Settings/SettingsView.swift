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
    
    @State var isPremium: Bool = true
    @State var isAnonymous: Bool = false
    @State var showCreateAccountView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchasesSection
                applicationSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView(logOption: .signUp)
                    .presentationDetents([.medium])
            }
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
        .environment(AppState())
}
// MARK: REUSABLE COMPONENTS
fileprivate extension View {
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background()
    }
}

// MARK: COMPONENTS
extension SettingsView {
    private var accountSection: some View {
        Section {
            if !isAnonymous {
                Text("Save and BackUp Account")
                    .rowFormatting()
                    .anyButtonStyle(.highlight) {
                        showCreateAccountView.toggle()
                    }
                    .removeListRowFormatting()

            } else {
                Text("Sign out")
                    .rowFormatting()
                    .anyButtonStyle(.highlight) {
                        
                    }
                    .removeListRowFormatting()
                
                Text("Delete account")
                    .rowFormatting()
                    .foregroundStyle(.red)
                    .anyButtonStyle(.highlight) {
                        
                    }
                    .removeListRowFormatting()
            }
        } header: {
            Text("Account")
        }

    }
    private var purchasesSection: some View {
        Section {
            HStack {
                Text("Account Status: \(isPremium ? "Premium" : "Free" )")
    
                Spacer()
                
                if isPremium {
                    Text("Manage")
                        .badgeFormatting()
                }
            }
            .rowFormatting()
            .anyButtonStyle(.highlight) {
                
            }
            .removeListRowFormatting()

        } header: {
            Text("Purchases")
        }
    }
    private var applicationSection: some View {
        Section {
                HStack {
                    Text("Version")
                    
                    Spacer()
                    
                    Text("1.0").foregroundStyle(.secondary)
                }
                .rowFormatting()
                .anyButtonStyle(.highlight) {
                    
                }
                .removeListRowFormatting()

                HStack {
                    Text("Build Number")
                    
                    Spacer()
                    
                    Text("3").foregroundStyle(.secondary)
                }
                .rowFormatting()
                .anyButtonStyle(.highlight) {
                    
                }
                .removeListRowFormatting()

                HStack {
                    Text("Contact Us")
                        .foregroundStyle(.red)
                        .anyButtonStyle(.plain) {
                            
                        }
                    }
                .rowFormatting()
                .anyButtonStyle(.highlight) {
                    
                }
                .removeListRowFormatting()

        } header: {
            Text("Application")
        } footer: {
            VStack(alignment: .leading) {
                Text("Created by fucking me")
                Text("Fuck you")
            }
        }
    }
}
