//
//  ForgotView.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

struct ForgotView: View {
    @Bindable private var viewModel: ForgotViewModel
    @Environment(\.dismiss) private var dissmis
    private let constants = Constants.shared
    
    init(_ viewModel: ForgotViewModel) {
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
                            title: "forgot_password_title",
                            subtitle: "forgot_password_subtitle",
                            maxWidth: constants.scrnPercForTitle(geometry)
                        )
                        .padding(.top, 70)
                        
                        //main scroll
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: Constants.paddingBetweenSections) {
                                // form
                                VStack(spacing: 2) {
                                    ValidatingField(
                                        "placeholder_email",
                                        text: $viewModel.email,
                                        gradientColor: (.blue,.blue),
                                        needsSecurity: false,
                                        maxWidth: geometry.size.width,
                                        maxHeight: 60
                                    )
                                    .keyboardType(.emailAddress)
                                    .textContentType(.emailAddress)
                                    .submitLabel(.next)
                                    .padding(.bottom, 5)
                                    
                                    ValidatingMessage(viewModel.errorEmail)
                                    
                                    ValidatingButton(
                                        viewModel.validateForgotForm,
                                        colorButton: .blue,
                                        maxWidth: geometry.size.width,
                                        maxHeight: geometry.size .width * 0.1,
                                        buttonName: "btn_forgot_password_send"
                                    )
                                    .padding(.vertical, 10)
                                    
                                    HaveAccount(
                                        haveAccount: true,
                                        tapButton: viewModel.showSignInView
                                    )
                                    .padding(10)
                                    
                                    SocialMediaAccess()
                                        .padding(.top, 20)
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
            AnalyticsService.specialScreenView("Forgot Password")
        }
    }
}

#Preview {
    ForgotView( ForgotViewModel( LandingViewModel( LandingCoordinator( AppCoordinator() ) ) ) )
}
