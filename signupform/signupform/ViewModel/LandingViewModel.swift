//
//  LandingViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/7/24.
//

import Combine
import Firebase
import FirebaseAuth
import Observation
import SwiftData
import SwiftUI

@Observable
final class LandingViewModel {
    private let authRepository = AuthRepository()
    private var cancellables = Set<AnyCancellable>()
    private var user: UserModel?
    
    var isErrorToast = false
    var forgetSheet = false
    var modalSheet = false
    var signInSheet = false
    var signUpSheet = false
    var showToastError = false
    var activityIndicatorMessage = ""
    var toastErrorTitle = ""
    var toastErrorMessage = ""
    
    private func closeAllSheets() {
        forgetSheet = false
        modalSheet = false
        signInSheet = false
        signUpSheet = false
        showToastError = false
    }
    
    private func showError(title: String, message: String) {
        closeAllSheets()
        toastErrorTitle = title
        toastErrorMessage = message
        isErrorToast = true
        withAnimation {
            showToastError.toggle()
        }
    }
    
    private func showError(_ error: FirebaseServiceError) {
        showError(title: "Authentication", message: error.localizedDescription)
    }
    
    private func successMessage() {
        closeAllSheets()
        toastErrorTitle = "Authentication"
        toastErrorMessage = "Message sent"
        isErrorToast = false
        withAnimation {
            showToastError.toggle()
        }
    }
    
    private func showActivityIndicator(_ message: String) {
        closeAllSheets()
        activityIndicatorMessage = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.modalSheet.toggle()
        }
    }
    
    private func goToHome() {
        AnalyticsService.logInUser()
        closeAllSheets()
        
        guard let user = self.user else {
            showError(title: "Creating user", message: "Don't exist user.")
            return
        }
        
        do {
            try DataService.shared.deleteModel()
            try UserRepository().createUser(user)

        } catch {
            CrashlyticsService.logError(error)
            showError(title: "Creating user", message: "Can't create a new user.")
        }
    }
    
    private func forgotPassword() {
        closeAllSheets()
    }
    
    func previousLogin() {
        if authRepository.currentLogin() {
            
        }
    }
    
    func showForgotView() {
        closeAllSheets()
        forgetSheet.toggle()
    }

    func showSignInView() {
        closeAllSheets()
        signInSheet.toggle()
    }
    
    func showSignUpView() {
        closeAllSheets()
        signUpSheet.toggle()
    }
    
    func createUser(fullname: String, email: String, password: String) {
        showActivityIndicator("message_sign_up")
        let newUser = UserModel(fullname: fullname, email: email)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            self.authRepository.signUp(user: newUser, password: password)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        self.goToHome()
                    case .failure(let error):
                        AnalyticsService.logEvent(
                            "Error trying to Sign Up",
                            parameters: [AnalyticsParameterValue : error.localizedDescription]
                        )
                        self.showError(error)
                    }
                },
                      receiveValue: { user in
                    self.user = user
                })
                .store(in: &self.cancellables)
        }
    }
    
    func logIn(email: String,  password: String) {
        showActivityIndicator("message_sign_in")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.authRepository.signIn(email: email, password: password)
                .sink { completion in
                    switch completion {
                    case .finished:
                        self.goToHome()
                    case .failure(let error):
                        AnalyticsService.logEvent(
                            "Error trying to Sign In",
                            parameters: [AnalyticsParameterValue : error.localizedDescription]
                        )
                        self.showError(error)
                    }
                } receiveValue: { user in
                    self.user = user
                }
                .store(in: &self.cancellables)
        }
    }
    
    func forgotPassword(_ email: String) {
        showActivityIndicator("message_forgot_password")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.authRepository.forgotPassword(email)
                .sink { completion in
                    switch completion {
                    case .finished:
                        self.successMessage()
                    case .failure(let error):AnalyticsService.logEvent(
                        "Error trying to recover password",
                        parameters: [AnalyticsParameterValue : error.localizedDescription]
                    )
                        self.showError(error)
                    }
                } receiveValue: { _ in }
                .store(in: &self.cancellables)

        }
    }
}

