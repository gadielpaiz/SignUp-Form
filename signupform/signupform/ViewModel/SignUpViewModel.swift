//
//  SignUpViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var fullName  = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var validationMessage: [String : String] = [:]
    private var validation = Validations()
    
     func submitValidation() {
        validationMessage = [:]
        
        do {
            _ = try validation.isValidFullName(fullName)
        } catch validationError.fullNameIsRequiere {
            validationMessage["fullname"] = "Full name is requiere"
        } catch validationError.fullNameIsNotValid {
            validationMessage["fullname"] = "Full name is not valid"
        } catch {
            validationMessage["fullname"] = "An unexpected error occurred"
        }
        
        do {
            _ = try validation.isValidEmail(email)
        } catch validationError.emailIsRequiere {
            validationMessage["email"] = "Email is requiere"
        } catch validationError.emailIsNotValid {
            validationMessage["email"] = "Email is not valid"
        } catch {
            validationMessage["email"] = "An unexpected error occurred"
        }
       
        do {
            _ = try validation.isValidPassword(password)
        } catch validationError.passwordIsRequiere {
            validationMessage["password"] = "Password is requiere."
        } catch validationError.passwordPolicies {
            validationMessage["password"] = "Password needs at least 8 characters"
        } catch {
            validationMessage["password"] = "An unexpected error occurred"
        }
        
        if validationMessage.isEmpty {
            validationMessage["Validation"] = "Sign Up is Complete "
        }
    }
}
