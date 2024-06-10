//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @Bindable private var viewModel: SignUpViewModel
    @FocusState private var focusedField: SignUpViewModel.Fields?
    @Environment(\.dismiss) private var dismiss
    private let constants = Constants.shared
    @State private var isSecure = true
    
    init(_ viewModel: SignUpViewModel) {
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
                            title: "sign_up_title",
                            subtitle: "sign_up_subtitle",
                            maxWidth: constants.scrnPercForTitle(geometry)
                        )
                        .padding(.top, 40)
                        
                        ScrollView(.vertical) {
                            VStack(spacing: Constants.paddingBetweenSections) {
                                
                                VStack(spacing: 8) {
                                    
                                    ValidatingField(
                                        "placeholder_fullname",
                                        text: $viewModel.fullname,
                                        gradientColor: (.blue, .blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size.width * 0.1
                                    )
                                    .focused($focusedField, equals: .fullname)
                                    .textInputAutocapitalization(.words)
                                    .textContentType(.name)
                                    .submitLabel(.next)
                                    
                                    ValidatingMessage(viewModel.errorMessage["fullname"])
                                    
                                    ValidatingField(
                                        "placeholder_email",
                                        text: $viewModel.email,
                                        gradientColor: (.blue, .blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size.width * 0.1
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
                                            maxHeight: geometry.size.width * 0.1
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
                                    
                                    ValidatingMessage(viewModel.errorMessage["password"])
                                    
                                    ValidatingButton(
                                        { viewModel.validateSignUpForm() },
                                        colorButton: .blue,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 60,
                                        buttonName: "btn_sign_up_create_account"
                                    )
                                    
                                    HaveAccount(tapButton: viewModel.showSignInView)
                                        .padding(.top, 10)
                                }
                                .onSubmit {
                                    switch focusedField  {
                                    case .fullname:
                                        focusedField = .email
                                    case .email:
                                        focusedField = .password
                                    default:
                                        break
                                    }
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
    SignUpView( SignUpViewModel( LandingViewModel ( LandingCoordinator ( AppCoordinator() ) ) ) )
        .environment(\.locale, Locale(identifier: "es"))
}
