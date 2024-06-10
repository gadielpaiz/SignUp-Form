//
//  SignUpViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI
import Combine

@Observable
final class SignUpViewModel  {
    private let landingViewModel: LandingViewModel
    
    init(_ landingViewModel: LandingViewModel) {
        self.landingViewModel = landingViewModel
    }
    
    enum Fields {
        case fullname
        case email
        case password
    }
    
    var fullname = ""
    var email = ""
    var password = ""
    // Use dictionary to manage error message
    var errorMessage: [String : String] = [:]
    
    func showSignInView() {
        landingViewModel.showSignInView()
    }
    
    func validateSignUpForm() {
        // Validator instance
        let validator = Validations()
        
        // Trim whitespaces and newlines
        fullname = fullname.trimmingCharacters(in: .whitespacesAndNewlines)
        email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Attempt validation
        do {
            try validate(fullname: fullname, with: validator)
            try validate(email: email, with: validator)
            try validate(password: password, with: validator)
            
            // Create account if all validations pass
            landingViewModel.createUser(fullname: fullname, email: email, password: password)
        } catch {
            // Handle specific errors
            CrashlyticsService.logError(error)
            handleError(error)
        }
    }
    
    // Specific validation functions
    private func validate(fullname: String, with validator: Validations) throws {
        guard try validator.isValidFullname(fullname) else { throw ValidationError.fullNameIsNotValid }
    }
    
    private func validate(email: String, with validator: Validations) throws {
        guard try validator.isValidEmail(email) else { throw ValidationError.emailIsNotValid }
    }
    
    private func validate(password: String, with validator: Validations) throws {
        guard try validator.isValidPassword(password) else { throw ValidationError.passwordPolicies }
    }
    
    // Centralized error handling
    private func handleError(_ error: Error) {
        // Clear previous error message
        errorMessage.removeAll()
        
        if let authError = error as? ValidationError {
            switch authError {
            case .fullNameIsRequiere:
                errorMessage["fullname"] = "full_name_error_required"
            case .fullNameIsNotValid:
                errorMessage["fullname"] = "full_name_error_name"
            case .emailIsRequiere:
                errorMessage["email"] = "email_error_required"
            case .emailIsNotValid:
                errorMessage["email"] = "email_error_not_valid"
            case .passwordIsRequiere:
                errorMessage["password"] = "password_error_required"
            case .passwordPolicies:
                errorMessage["password"] = "password_error_policies"
            }
        } else {
            // Log unknown errors
            print("Unknown Authentication error: \(error)")
        }
    }
}
