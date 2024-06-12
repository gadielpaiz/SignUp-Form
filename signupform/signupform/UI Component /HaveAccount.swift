//
//  HaveAccount.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

struct HaveAccount: View {
    var haveAccount = true
    let tapButton: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Text(haveAccount ? "Do you already have an account?" : "Don't you have an account?")
                .normalTextStyle()
            
            Button(haveAccount ? "Sign In" : "Sign Up", action: tapButton)
                .buttonStyle(TextButtonStyle())
        }
    }
}

#Preview {
    HaveAccount(tapButton: { })
}
