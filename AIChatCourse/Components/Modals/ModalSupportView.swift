//
//  ModalSupportView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 13/01/25.
//

import SwiftUI

struct ModalSupportView <Content: View>: View {
    @Binding var showModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                Color.black.ignoresSafeArea().opacity(0.5)
                    .transition(.opacity.animation(.smooth))
                    .onTapGesture {
                        showModal = false
                    }
                    .zIndex(1)
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)
            }
        }
        .zIndex(9999)
        .animation(.bouncy, value: showModal)
    }
}

#Preview {
    @Previewable @State var showModal = true
    var avatar = AvatarModel.mock
    
        Button("Ok") {
            showModal = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .showModal($showModal, transition: .slide) {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 200, height: 200)
        .padding()
    }
}

extension View {
    func showModal(_ showModal: Binding<Bool>, transition: AnyTransition, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay {
                ModalSupportView(showModal: showModal) {
                    content()
                        .transition(transition)
                }
            }
    }
}
