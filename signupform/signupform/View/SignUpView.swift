//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var signUpViewModel = SignUpViewModel()
    
    
    var body: some View {
        ZStack {
            Backgroud(colorLeading: .blue, colorTrailing: .red, startPoint: .bottomLeading, endPoint: .topTrailing)
            
            VStack {
                Spacer()
                
                Text("Sign Up")
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .padding(.vertical)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        TextField("Full name", text: $signUpViewModel.fullName )
                            .offset(y: 8)
                            .padding(.vertical, 10)
                        
                        if let fullNameMessage = signUpViewModel.validationMessage["fullname"] {
                            Text(fullNameMessage)
                                .foregroundStyle(.red)
                                .offset(y: 8)
                                .padding(.top, 10)
                        } else {
                            Text("")
                                .padding(.vertical, 10)
                        }
                        
                        TextField("Email", text: $signUpViewModel.email )
                            .keyboardType(.emailAddress)
                            .offset(y: 8)
                            .padding(.vertical, 10)
                        
                        if let emailMessage = signUpViewModel.validationMessage["email"] {
                            Text(emailMessage)
                                .foregroundStyle(.red)
                                .offset(y: 8)
                                .padding(.top, 10)
                        }  else {
                            Text("")
                                .padding(.vertical, 10)
                        }
                        
                        SecureField("Password", text: $signUpViewModel.password )
                            .offset(y: 8)
                            .padding(.vertical, 10)
                        
                        if let passwordMessage = signUpViewModel.validationMessage["password"] {
                            Text(passwordMessage)
                                .foregroundStyle(.red)
                                .offset(y: 8)
                                .padding(.top, 10)
                        }  else {
                            Text("")
                                .padding(.vertical, 10)
                        }
                        
                        
                        Button("Submit") {
                            signUpViewModel.submitValidation()
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .padding(.vertical, 12)
                        
                        if let validMessage = signUpViewModel.validationMessage["Validation"] {
                            Text(validMessage)
                                .foregroundStyle(.green)
                                .font(.headline)
                                .offset(y: 8)
                                .padding(.top, 1)
                        }  else {
                            Text("")
                                .padding(.top, 1)
                        }
                        
                    }
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                Spacer()
            }
            .onAppear {
                AnalitycsService.currentScreenView("Sign Up")
            }
        }
    }
}


#Preview {
    SignUpView()
}
