//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @FocusState private var focushedField: SignUpViewModel.Fields?
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
                                        text: .constant(""),
                                        gradientColor: (.blue, .blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size.width * 0.1
                                    )
                                    
                                    
                                    ValidatingMessage("")
                                    
                                    ValidatingField(
                                        "Enter your Email",
                                        text: .constant(""),
                                        gradientColor: (.blue, .blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size.width * 0.1
                                    )
                                    
                                    ValidatingMessage("")
                                    
                                    ZStack {
                                        ValidatingField(
                                            "Enter your password",
                                            text: .constant(""),
                                            gradientColor: (.blue, .blue),
                                            needsSecurity: isSecure,
                                            maxWidth: geometry.size.width,
                                            maxHeight: geometry.size.width * 0.1
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
                                    }
                                    
                                    ValidatingMessage("")
                                    
                                    ValidatingButton(
                                        {},
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
            AnalyticsService.specialScreenView("Sign Up")
        }
        .onDisappear {
            dismiss()
        }
    }
}


#Preview {
    SignUpView()
}
