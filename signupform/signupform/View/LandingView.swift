//
//  HomeScreen.swift
//  signupform
//
//  Created by Gadiel Paiz on 5/21/24.
//

import SwiftUI

struct LandingView: View {
    @State private var isItPressedToSignUp = false
    @State private var isItPressedToSignIn = false
    private let constants = Constants.shared
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                TitleAndSubtitle(
                    title: "Landing View",
                    subtitle: "Lading View sub",
                    maxWidth: constants.scrnPercForTitle(geometry)
                )
                .padding(.top, 30)
                
                Spacer()
                
                HStack(spacing: 30) {
                    Button("Sign Up") {
                        isItPressedToSignUp = true
                    }
                    .sheet(isPresented: $isItPressedToSignUp,
                           content: { SignUpView() }
                    )
                    
                    Button("Sign In") {
                        isItPressedToSignIn = true
                    }
                    .sheet(isPresented: $isItPressedToSignIn,
                           content: { SignInView() }
                    )                    
                }
                .buttonStyle(GradientButtonStyle(color: .blue, maxWidth: geometry.size.width, maxHeight: geometry.size.width * 0.1))
                .padding(.horizontal, Constants.mainHorizontalPadding)
                .padding(.bottom, 20)
                
                SocialMediaAccess()
                    .padding(.horizontal, Constants.mainHorizontalPadding)
                    .padding(.bottom, 37)
            }
        }
        .background(BackgroundHome(iphoneScaleFirst: 0.98, iphoneScaleSecond: 0.92))
        .onAppear {
            AnalyticsService.currentScreenView("Landing View")
        }
    }
}

#Preview {
    LandingView()
}
