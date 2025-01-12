//
//  AsyncCallToActionButton.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    var title: String
    var isLoading: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                Text(title)
            }
        }
        .asCallToActionButton()
        .anyButtonStyle(.press, action: {
            action()
        })
        .disabled(isLoading)
    }
}

#Preview {
    @Previewable @State var charging = false
    AsyncCallToActionButton(title: "Hello World", isLoading: charging, action: {
        charging = true
    })
}
