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
    
    var body: some View {
        ZStack {
            BackgroundHomeView(iphoneScaleFirst: 0.98, iphoneScaleSecond: 0.9)
            
            GeometryReader { geometry in
                
                VStack {
                    Spacer()
                    
                    HStack(alignment: .bottom, spacing: 55) {
                        Spacer()
                        
                        Button("Sign Up") {
                            isItPressedToSignUp = true
                        }
                        .buttonStyle(GradientButtonStyle(color: .blue, maxWidth: geometry.size.width * 1 / 5, maxHeight: geometry.size.height * 1 / 10))
                        .foregroundStyle(.white)
                        .sheet(isPresented: $isItPressedToSignUp) {
                            
                        } content: {
                            SignUpView()
                        }
                        
                        
                        Button("Sign In") {
                            isItPressedToSignIn = true
                        }
                        .buttonStyle(GradientButtonStyle(color: .blue, maxWidth: geometry.size.width * 1 / 5, maxHeight: geometry.size.height * 1 / 10))
                        .foregroundStyle(.white)
                        .sheet(isPresented: $isItPressedToSignIn) {
                            
                        } content: {
                            NavigationStack {
                                SignInView()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, min(geometry.size.width, geometry.size.height) * 0.18)
                }
            }
        }
    }
}

#Preview {
    LandingView()
}
