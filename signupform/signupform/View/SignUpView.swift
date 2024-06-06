//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isSecure = true
    @StateObject private var signUpViewModel = SignUpViewModel()
    private let constants = Constants.shared
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                Spacer()
                
                VStack(spacing: 0) {
                    CloseButton()
                    
                    VStack(spacing: Constants.paddingBetweenSections) {
                        
                        TitleAndSubtitle(
                            title: "Sign Up",
                            subtitle: "Get Stared!",
                            maxWidth: constants.scrnPercForTitle(geometry)
                        )
                        .padding(.top, 40)
                        
                        ScrollView(.vertical) {
                            VStack(spacing: Constants.paddingBetweenSections) {
                                
                                VStack(spacing: 8) {
                                    
                                    ValidatingField(
                                        "Enter your full name",
                                        text: $signUpViewModel.fullName,
                                        gradientColor: (.black, .black),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size.width * 0.1
                                    )
                                    
                                    ValidatingMessage(signUpViewModel.validationMessage["fullname"])
                                    
                                    ValidatingField(
                                        "Enter your Email",
                                        text: $signUpViewModel.email,
                                        gradientColor: (.black, .black),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size.width * 0.1
                                    )
                                    
                                    ValidatingMessage(signUpViewModel.validationMessage["email"])
                                    
                                    ZStack {
                                        ValidatingField(
                                            "Enter your password",
                                            text: $signUpViewModel.password,
                                            gradientColor: (.black, .black),
                                            needsSecurity: isSecure,
                                            maxWidth: geometry.size.width,
                                            maxHeight: geometry.size.width * 0.1
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
                                        .padding(.leading, 290)
                                    }
                                    
                                    ValidatingMessage(signUpViewModel.validationMessage["password"])
                                    
                                    ValidatingButton(
                                        signUpViewModel.submitValidation,
                                        colorButton: .blue,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 60,
                                        buttonName: "Create Account"
                                    )
                                    
                                    HaveAccount(tapButton: {})
                                        .padding(.top, 10)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, Constants.mainHorizontalPadding)
                }
                .frame(
                    width: geometry.size.width,
                    height: constants.scrnPercForSheet(geometry),
                    alignment: .center
                )
                .background(BackgroudSign())
                .clipShape(RoundedRectangle(cornerRadius: Constants.sheetCornerRadius))
            }
        }
        .presentationBackground(.clear)
        .ignoresSafeArea()
        .onAppear {
            AnalitycsService.specialScreenView("Sign Up")
        }
        .onDisappear {
            dismiss()
        }
    }
}


#Preview {
    SignUpView()
}
