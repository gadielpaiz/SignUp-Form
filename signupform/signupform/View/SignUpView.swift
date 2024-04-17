//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        VStack {
            
            Text("Sign Up")
                .font(.system(.title, design: .rounded, weight: .semibold))
                .padding(.top)
            HStack {
                Spacer()
                
                VStack {
                    TextField("Full name", text: $fullname )
                    TextField("Email", text: $email )
                    SecureField("Password", text: $password )
                    
                    Button("Submit") {
                        
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .onAppear {
            AnalitycsService.currentScreenView("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
