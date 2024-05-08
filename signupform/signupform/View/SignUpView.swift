//
//  SignUpView.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            BackgroudView(firstColor: .red, secondColor: .blue, thirdColor: .green, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Spacer()
                
                Text("Sign Up")
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .padding(.vertical)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        
                        ValidatingField(
                            "Full name",
                            text: $signUpViewModel.fullName,
                            gradientColor: (.gray, .black),
                            needsSecurity: false
                        )
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["fullname"] ,
                            isError: true,
                            validationText: false
                        )
                        
                        ValidatingField(
                            "Email",
                            text: $signUpViewModel.email,
                            gradientColor: (.black, .black),
                            needsSecurity: false
                        )
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["email"] ,
                            isError: true,
                            validationText: false
                        )
                        
                        ValidatingField(
                            "Password",
                            text: $signUpViewModel.password,
                            gradientColor: (.black, .gray),
                            needsSecurity: true
                        )
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["password"] ,
                            isError: true,
                            validationText: false
                        )
                        
                        ValidatingButton(
                            buttonName: "Submit",
                            action: signUpViewModel.submitValidation,
                            color: .blue,
                            maxWidth: 100,
                            maxHeight: 50
                        )
                 
                        
                        ValidatingMessage(
                            message: signUpViewModel.validationMessage["Validation"] ,
                            isError: false,
                            validationText: true
                        )
                            
                        
                    }
                    .multilineTextAlignment(.center)
                    
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
