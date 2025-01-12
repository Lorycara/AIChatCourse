//
//  CreateAvatarView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.dismiss) var dismiss
    
    // MARK: LOGIC VAR
    @State var avatarName: String = ""
    @State var generatedImage: UIImage?
    @State var isGenerating: Bool = false
    @State var isSaving: Bool = false
    
    @State private var characterOption: CharacterOption = .default
    @State private var characterAction: CharacterAction = .default
    @State private var characterLocation: CharacterLocation = .default
    var body: some View {
        NavigationStack {
            List {
                avatarNameSection
                
                pickersSection
                
                imageSection

                saveButton
            }
            .navigationTitle("Create Avatar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
        }
    }
}

#Preview {
    CreateAvatarView()
}

// MARK: LOGIC
extension CreateAvatarView {
    func onGenerateImageButtonPressed() {
        isGenerating = true
        Task {
            try? await Task.sleep(for: .seconds(2))
            generatedImage = UIImage(systemName: "star.fill")
            isGenerating = false
        }
    }
    
    func onSaveImageButton() {
        // ADD
        isSaving = true
        Task {
            try? await Task.sleep(for: .seconds(2))
            isSaving = false
        }
    }
}

// MARK: COMPONENTS
extension CreateAvatarView {
    private var avatarNameSection: some View {
        Section {
            TextField(text: $avatarName) {
                Text("Player 1")
            }
        }header: {
            Text("Name your avatar")
        }
    }
    
    private var pickersSection: some View {
        Section {
            Picker(
                selection: $characterOption) {
                    ForEach(CharacterOption.allCases, id: \.self) { option in
                        Text("\(option.rawValue.capitalized)")
                            .tag(option)
                    }
                } label: {
                    Text("A: ")
                }
            Picker(
                selection: $characterAction) {
                    ForEach(CharacterAction.allCases, id: \.self) { option in
                        Text("\(option.rawValue.capitalized)")
                            .tag(option)
                    }
                } label: {
                    Text("that is:")
                }
            Picker(
                selection: $characterLocation) {
                    ForEach(CharacterLocation.allCases, id: \.self) { option in
                        Text("\(option.rawValue.capitalized)")
                            .tag(option)
                    }
                } label: {
                    Text("in the: ")
                }

        }
    }
    
    private var imageSection: some View {
        Section {
            VStack {
                Text("Generate Image")
                    .frame(maxWidth: .infinity)
                    .anyButtonStyle(.highlight) {
                        onGenerateImageButtonPressed()
                    }
                    .disabled(isGenerating || avatarName.isEmpty)
                Circle()
                    .fill(Color.secondary.opacity(0.3))
                    .frame(width: 250, height: 250)
                    .overlay {
                        ZStack {
                            if isGenerating {
                                ProgressView()
                            } else {
                                Image(uiImage: generatedImage ?? UIImage())
                                    .resizable()
                                    .clipShape(Circle())
                            }
                        }
                        
                    }
            }
            .removeListRowFormatting()

        }
    }
    
    private var saveButton: some View {
        Section {
            AsyncCallToActionButton(title: "Save", isLoading: isSaving, action: {
                onSaveImageButton()
            })
                .removeListRowFormatting()
        }
        .animation(.smooth, value: isSaving)
    }
    
    private var backButton: some View {
        Image(systemName: "xmark")
            .foregroundStyle(.red)
            .font(.title2)
            .fontWeight(.semibold)
            .anyButtonStyle(.plain) {
                dismiss()
            }
    }
}
