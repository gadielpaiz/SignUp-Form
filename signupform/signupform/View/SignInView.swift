//
//  SignInView.swift
//  signupform
//
//  Created by Gadiel Paiz on 5/21/24.
//

import SwiftUI

struct SignInView: View {
    @FocusState private var focusedField: SignInViewModel.Fields?
    @Bindable private var viewModel: SignInViewModel
    @Environment(\.dismiss) private var dismiss
    private let constants = Constants.shared
    @State private var isSecure = true
    
    init(_ viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                Spacer()
                
                VStack(spacing: 0) {
                    CloseButton()
                    
                    VStack(spacing: Constants.paddingBetweenSections) {
                        TitleAndSubtitle(
                            title: "sign_in_title",
                            subtitle: "sign_in_subtitle",
                            maxWidth: constants.scrnPercForTitle(geometry)
                        )
                        .padding(.top, 50)
                        
                        ScrollView(.vertical) {
                            VStack(spacing: Constants.paddingBetweenSections) {
                                VStack(spacing: 14) {
                                    ValidatingField(
                                        "placeholder_email",
                                        text: $viewModel.email ,
                                        gradientColor: (.blue, .blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 70
                                    )
                                    .focused($focusedField, equals: .email)
                                    .keyboardType(.emailAddress)
                                    .textContentType(.emailAddress)
                                    .submitLabel(.next)
                                    
                                    ValidatingMessage(viewModel.errorMessage["email"])
                                    
                                    ZStack {
                                        ValidatingField(
                                            "placeholder_password",
                                            text: $viewModel.password,
                                            gradientColor: (.blue, .blue),
                                            needsSecurity: isSecure,
                                            maxWidth: geometry.size.width,
                                            maxHeight: 70
                                        )
                                        .focused($focusedField, equals: .password)
                                        .textContentType(.password)
                                        .submitLabel(.done)
                                        
                                        Button(action: { isSecure.toggle() }) {
                                            if !viewModel.password.isEmpty {
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
                                    
                                    ValidatingMessage(
                                        viewModel.errorMessage["password"]
                                    )
                                    
                                    HStack(spacing: 0) {
                                        Toggle(isOn: $viewModel.rememberMe,
                                               label: {
                                            Text("remember_me")
                                        })
                                            .toggleStyle(CheckBoxToggleStyle())
                                        
                                        Spacer()
                                        
                                        Button("btn_forgot_password",
                                               action: {
                                            viewModel.showForgotView()
                                        } )
                                        .buttonStyle(TextButtonStyle())
                                    }
                                    
                                    ValidatingButton(
                                        viewModel.validateSignInForm,
                                        colorButton: .blue,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 100,
                                        buttonName: "btn_sign_in_access"
                                    )
                                    .padding(.top, 5)
                                    
                                    HaveAccount(haveAccount: false,tapButton: viewModel.showSignUpView)
                                        .padding(.top, 10)

                                }
                                .onSubmit {
                                    switch focusedField {
                                    case .email:
                                        focusedField = .password
                                    default:
                                        break
                                    }
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
    SignInView(SignInViewModel( LandingViewModel( LandingCoordinator( AppCoordinator() ) ) ))
        .environment(\.locale, Locale(identifier: "es"))
}
