//
//  View+EXT.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 10/01/25.
//

import SwiftUI

extension View {
    // MARK: BUTTONS
    func asCallToActionButton() -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .fontWeight(.semibold)
            .background(.accent)
            .foregroundColor(.white)
            .cornerRadius(16)
    }
    
    func badgeFormatting() -> some View {
        self
            .font(.caption)
            .bold()
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .foregroundStyle(.white)
            .background(.blue)
            .cornerRadius(10)
    }
    
    func tappableBackground() -> some View {
        self
            .background(Color.black.opacity(0.00001))
    }
    
    func removeListFormatting() -> some View {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
    
    @ViewBuilder
    func ifSatisfiedCondition(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
        
    }
}
