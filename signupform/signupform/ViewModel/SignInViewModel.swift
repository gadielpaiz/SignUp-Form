//
//  SignInViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import Observation

@Observable
final class SignInViewModel {
    private let landingViewModel: LandingViewModel
    
    init(_ landingViewModel: LandingViewModel) {
        self.landingViewModel = landingViewModel
    }
    
    enum Fields {
        case email
        case password
    }
    
    var rememberMe = true
    var email = ""
    var password = ""
    // Use dictionary to manage error message
    var errorMessage: [String : String] = [:]
    
    
    func showSignUpView() {
        landingViewModel.showSignUpView()
    }
    
    func showForgotView() {
        landingViewModel.showForgotView()
    }
    
    func validateSignInForm() {
        // Validator instance
        let validator = Validations()
        
        // Trim whitespace and new lines
        email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Attempt validations
        do {
            try validate(email: email, with: validator)
            try validate(password: password, with: validator)
            
            
            landingViewModel.logIn(email: email, password: password)
        } catch {
            // Handle specific errors
            CrashlyticsService.logError(error)
            handleError(error)
        }
    }
    
    //Specific validation function
    private func validate(email: String, with validator: Validations) throws {
        guard try validator.isValidEmail(email) else { throw ValidationError.emailIsNotValid }
    }
    
    private func validate(password: String, with validator: Validations) throws {
        guard try validator.isValidPassword(password) else { throw ValidationError.passwordPolicies}
    }
    
    //Centralized error hangling
    private func handleError(_ error: Error) {
        // Clear previous error message
        errorMessage.removeAll()
        
        if let authError = error as? ValidationError {
            switch authError {
            case .emailIsNotValid:
                errorMessage["email"] = "email_error_not_valid"
            case .emailIsRequiere:
                errorMessage["email"] = "email_error_required"
            case .passwordPolicies:
                errorMessage["password"] = "password_error_policies"
            case .passwordIsRequiere:
                errorMessage["password"] = "password_error_required"
            default:
                print("Unknown Authentication error: \(error)")
            }
        }
    }
    
}
