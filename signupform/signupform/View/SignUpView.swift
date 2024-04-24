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
            BackgroudView(firstColor: .blue, secondColor: .purple, thirdColor: .orange, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Spacer()
                
                Text("Sign Up")
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .padding(.vertical)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        TextField("Full name", text: $signUpViewModel.fullName )
                            .textFieldStyle(GradientBorderStyle(color1: .gray, color2: .black))
                            .offset(y: 8)
                            
                        
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
                            .textFieldStyle(GradientBorderStyle(color1: .black, color2: .black))
                            .keyboardType(.emailAddress)
                            .offset(y: 8)
                            
                        
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
                            .textFieldStyle(GradientBorderStyle(color1: .black, color2: .gray))
                            .offset(y: 8)
                        
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
                        .buttonStyle(GradientButtonStyle(color: .blue, maxWidth: 100, maxHeight: 50))
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
