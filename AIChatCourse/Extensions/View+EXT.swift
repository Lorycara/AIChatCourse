//
//  View+EXT.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .foregroundColor(.white)
            .cornerRadius(16)
    }
}
