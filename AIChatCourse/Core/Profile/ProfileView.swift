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
    @State private var currentUser: UserModel? = .mock
    @State private var showCreateAvatarView: Bool = false
    @State var avatars: [AvatarModel] =  []
    @State var isLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                
                avatarsSection
            }
            
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
        }
        .task {
            try? await loadData()
        }
        .animation(.easeInOut, value: isLoading)
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $showCreateAvatarView) {
            CreateAvatarView()
        }
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}

// MARK: COMPONENTS
extension ProfileView {
    private var myInfoSection: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColorCalculated ?? Color.accent)
                    .frame(width: 100, height: 100)
            }
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }
    }
    
    private var avatarsSection: some View {
        
            Section {
                if avatars.isEmpty {
                    Group {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Click + to Create an Avatar")
                        }
                    }
                        .foregroundStyle(.secondary)
                        .removeListRowFormatting()
                        .frame(maxWidth: .infinity)
                        .padding(50)
                } else {
                    ForEach(avatars, id: \.self) { avatar in
                        CustomListCellView(urlString: avatar.profileImageName, title: avatar.name)
                            .anyButtonStyle(.highlight, action: {
                                
                            })
                        
                            .removeListRowFormatting()
                    }
                    .onDelete(perform: onDeleteAvatarButtonPressed)
                }
            } header: {
                HStack {
                    Text("My Avatars")
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.accent)
                        .font(.title2)
                        .anyButtonStyle(.press) {
                            onNewAvatarButtonPressed()
                        }
                }
            }
    }
    private var settingsButton: some View {
        
        Image(systemName: "gear")
            .foregroundStyle(.accent)
            .onTapGesture {
                onSettingsButtonPressed()
            }
    }
}

// MARK: LOGIC
extension ProfileView {
    
    private func onSettingsButtonPressed() {
        showSettingsView.toggle()
    }
    
    private func onNewAvatarButtonPressed() {
        showCreateAvatarView.toggle()
    }
    
    private func onDeleteAvatarButtonPressed(indexSet: IndexSet) {
        avatars.remove(atOffsets: indexSet)
    }
    
    private func loadData()async throws {
        try? await Task.sleep(for: .seconds(1))
        isLoading = false
        avatars = AvatarModel.mocks
    }
}
