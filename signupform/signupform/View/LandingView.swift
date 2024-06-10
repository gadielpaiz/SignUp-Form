//
//  HomeScreen.swift
//  signupform
//
//  Created by Gadiel Paiz on 5/21/24.
//

import SwiftUI
import TipKit

struct LandingView: View {
    @Bindable private var viewModel: LandingViewModel
    private let constants = Constants.shared
    
    init(_ viewModel: LandingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                TitleAndSubtitle(
                    title: "landing_title",
                    subtitle: "landing_subtitle",
                    maxWidth: constants.scrnPercForTitle(geometry)
                )
                .padding(.top, 30)
                
                Spacer()
                
                HStack(spacing: 30) {
                    Button("btn_sign_up") {
                        viewModel.showSignUpView()
                    }
                    
                    Button("btn_sign_in") {
                        viewModel.showSignInView()
                    }
                }
                .buttonStyle(GradientButtonStyle(color: .blue, maxWidth: geometry.size.width, maxHeight: geometry.size.width * 0.1))
                .padding(.horizontal, Constants.mainHorizontalPadding)
                .padding(.bottom, 20)
                
                SocialMediaAccess()
                    .padding(.horizontal, Constants.mainHorizontalPadding)
                    .padding(.bottom, 37)
            }
        }
        .sheet(isPresented: $viewModel.signInSheet) {
            SignInView(SignInViewModel(viewModel))
        }
        .sheet(isPresented: $viewModel.signUpSheet) {
            SignUpView(SignUpViewModel(viewModel))
        }
        .sheet(isPresented: $viewModel.forgotSheet) {
            ForgotView(ForgotViewModel(viewModel))
        }
        .fullScreenCover(isPresented: $viewModel.modalSheet) {
            ActivityIndicator(message: viewModel.activityIndicatorMessage)
        }
        .background(BackgroundHome(iphoneScaleFirst: 0.98, iphoneScaleSecond: 0.92))
        .onAppear {
            AnalyticsService.currentScreenView(.landing)
            viewModel.previousLogin()
        }
    }
}

#Preview {
    LandingView(LandingViewModel(LandingCoordinator(AppCoordinator())))
        .environment(\.locale, Locale(identifier: "es"))
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
