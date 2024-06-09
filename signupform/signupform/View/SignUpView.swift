//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var signUpViewModel = SignUpViewModel()
    @State private var isSecure = true
    
    var body: some View {
        ZStack {
            BackgroudView(firstColor: .blue, secondColor: .green, thirdColor: .red, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Spacer()
                
                Text("Sign Up")
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        
                        ValidatingField(
                            "Full name",
                            text: $signUpViewModel.fullName,
                            gradientColor: (.gray, .black),
                            needsSecurity: false,
                            maxWidth: 370,
                            maxHeight: 40
                        )
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["fullname"] ,
                            isError: false,
                            validationText: false
                        )
                        
                        ValidatingField(
                            "Email",
                            text: $signUpViewModel.email,
                            gradientColor: (.black, .black),
                            needsSecurity: false,
                            maxWidth: 370,
                            maxHeight: 40
                        )
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["email"] ,
                            isError: false,
                            validationText: false
                        )
                        
                        ZStack {
                            ValidatingField(
                                "Password",
                                text: $signUpViewModel.password,
                                gradientColor: (.black, .gray),
                                needsSecurity: isSecure,
                                maxWidth: 370,
                                maxHeight: 40
                            )
                            
                            Button(action: { isSecure.toggle() }) {
                                if !signUpViewModel.password.isEmpty {
                                    Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                                        .resizable()
                                        .frame(maxWidth: isSecure ? 30 : 32, maxHeight: isSecure ? 20 : 23)
                                } else {
                                    Image(systemName: "")
                                }
                            }
                            .padding(.top)
                            .padding(.leading, 300)
                        }
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["password"] ,
                            isError: false,
                            validationText: false
                        )
                        
                        ValidatingButton(
                            action: signUpViewModel.submitValidation,
                            color: .blue,
                            maxWidth: 100,
                            maxHeight: 50
                        )
                        
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["Validation"] ,
                            isError: true,
                            validationText: true
                        )
                        
                        
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
}


#Preview {
    SignUpView()
}
