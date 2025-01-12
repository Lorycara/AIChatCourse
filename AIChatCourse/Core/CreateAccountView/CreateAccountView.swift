//
//  CreateAccountView.swift
//  AIChatCourse
//
//  Created by Lorenzo Cara on 12/01/25.
//

import SwiftUI

struct CreateAccountView: View {
    @State var logOption: LogOption = .signIn
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("\(logOption == .signIn ? "Sign In your" : "Sign Up new") account?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Dont lose your data! Connect to an SSO provider to save your data account")
                .font(.body)
            
            SignInWithAppleButtonView(type: (logOption == .signIn ? .signIn : .signUp), style: .black, cornerRadius: 10)
                .frame(height: 50)
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CreateAccountView()
}

enum LogOption: String {
    case signIn = "Sign In"
    case signUp = "Sign Up"
}
