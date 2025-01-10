//
//  View+EXT.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

extension View {
    func asCallToActionButton() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .fontWeight(.semibold)
            .background(.accent)
            .foregroundColor(.white)
            .cornerRadius(16)
    }
    
    func tappableBackground() -> some View {
        self
            .background(Color.black.opacity(0.00001))
    }
}
