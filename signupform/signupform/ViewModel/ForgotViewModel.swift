//
//  ForgotViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import Observation

@Observable
final class ForgotViewModel {
    private let landingViewModel:LandingViewModel
    
    init(_ landingViewModel: LandingViewModel) {
        self.landingViewModel = landingViewModel
    }
    
    var email = ""
    var errorEmail = ""
    
    func showSignInView() {
        landingViewModel.showSignInView()
    }
    
    func validateForgotForm() {
        // Validator instances
        let validator = Validations()
        
        email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        do {
           try validate(email: email, with: validator)
            
            landingViewModel.forgotPassword(email)
        } catch {
            CrashlyticsService.logError(error)
            handleError(error)
        }
    }
    
    // Specific validation funtions
    private func validate(email: String, with validator: Validations) throws {
        guard try validator.isValidEmail(email) else { throw ValidationError.emailIsNotValid}
    }
    
    // Centralized error hanlind
    private func handleError(_ error: Error) {
        // Clear previous error message
        errorEmail.removeAll()
        
        if let authError = error as? ValidationError {
            switch authError {
            case .emailIsNotValid:
              errorEmail = "email_error_required"
            case .emailIsRequiere:
              errorEmail = "email_error_not_valid"
            default:
                print("Unknown Authentication error: \(error)")
            }
        }
    }
}
