//
//  SignInView.swift
//  signupform
//
//  Created by Gadiel Paiz on 5/21/24.
//

import SwiftUI

struct SignInView: View {
    @FocusState private var focusedField: SignInViewModel.Fields?
    @Environment(\.dismiss) private var dismiss
    private let constants = Constants.shared
    @State private var isSecure = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                Spacer()
                
                VStack(spacing: 0) {
                    CloseButton()
                    
                    VStack(spacing: Constants.paddingBetweenSections) {
                        TitleAndSubtitle(
                            title: "Sign In",
                            subtitle: "We happy to see you again.",
                            maxWidth: constants.scrnPercForTitle(geometry)
                        )
                        .padding(.top, 45)
                        
                        ScrollView(.vertical) {
                            VStack(spacing: Constants.paddingBetweenSections) {
                                VStack(spacing: 14) {
                                    ValidatingField(
                                        "Enter your email",
                                        text: .constant(""),
                                        gradientColor: (.blue, .blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 60
                                    )
                                    .focused($focusedField, equals: .email)
                                    
                                    ValidatingMessage(
                                        ""
                                    )
                                    
                                    ZStack {
                                        ValidatingField(
                                            "Enter your password",
                                            text: .constant(""),
                                            gradientColor: (.blue, .blue),
                                            needsSecurity: isSecure,
                                            maxWidth: geometry.size.width,
                                            maxHeight: 60
                                        )
                                        
//                                        Button(action: { isSecure.toggle() }) {
//                                            if !signUpViewModel.password.isEmpty {
//                                                Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
//                                                    .resizable()
//                                                    .frame(maxWidth: isSecure ? 30 : 32, maxHeight: isSecure ? 20 : 23)
//                                            } else {
//                                                Image(systemName: "")
//                                            }
//                                        }
//                                        .padding(.top)
//                                        .padding(.leading, 290)
//                                    }
//                                    
//                                    ValidatingMessage(
//                                        signUpViewModel.validationMessage["password"]
//                                    )
//                                    
//                                    HStack(spacing: 0) {
//                                        Button("Remember me") {
//                                            
//                                        }
//                                        Spacer()
//                                        
//                                        Button("Forgot Password") {
//                                            
//                                        }
//                                        .buttonStyle(TextButtonStyle())
                                    }
                                    ValidatingMessage("")
                                    
                                    ValidatingButton(
                                        {},
                                        colorButton: .blue,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 100,
                                        buttonName: "Access"
                                    )
                                    .padding(.top, 5)
                                    
                                    HaveAccount(haveAccount: false,tapButton: {})
                                        .padding(.top, 10)
                                }
                            }
                        }
                        .padding(.horizontal, Constants.mainHorizontalPadding)
                    }
                }
                .frame(
                    width: geometry.size.width,
                    height: constants.scrnPercForSheet(geometry),
                    alignment: .center
                )
                .background( BackgroudSign() )
                .clipShape(RoundedRectangle(cornerRadius: Constants.sheetCornerRadius))
            }
        }
        .presentationBackground(.clear)
        .ignoresSafeArea()
        .onAppear {
            AnalyticsService.specialScreenView("Sign In")
        }
        .onDisappear {
            dismiss()
        }
    }
}

#Preview {
    SignInView()
}
