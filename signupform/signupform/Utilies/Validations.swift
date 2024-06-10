//
//  Validations.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import Foundation
import FirebaseAnalytics

enum ValidationError: Error {
    case fullNameIsNotValid, fullNameIsRequiere
    case emailIsNotValid, emailIsRequiere
    case passwordPolicies, passwordIsRequiere
}

final class Validations: Error {
    // Combine all regex checks into a single method to reduce redundancy
    private func matches(_ string: String, regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: string)
    }
    // Generalized validation method to handle empty string validation and regex matching
    private func validate(_ value: String, with regex: String, emptyError: ValidationError, invalidError: ValidationError)throws -> Bool {
        guard !value.isEmpty else {
            AnalyticsService.logEvent(
                "Validations",
                parameters: [AnalyticsParameterValue : emptyError]
            )
            throw emptyError
        }
        
        guard matches(value, regex: regex) else {
            AnalyticsService.logEvent(
                "Validations",
                parameters: [AnalyticsParameterValue : invalidError]
            )
            throw invalidError
        }
        
        return true
    }
    
    func isValidFullname(_ fullName: String)throws -> Bool {
        let nameRegex = "^[A-Za-z]+(?:[\\'\\,\\.\\-][A-Za-z]+)*\\s[A-Za-z]+(?:[\\'\\,\\.\\-][A-Za-z]+)*$"
        return try validate(fullName, with: nameRegex, emptyError: .fullNameIsRequiere, invalidError: .fullNameIsNotValid)
    }
    
    func isValidEmail(_ email: String)throws -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        return try validate(email, with: emailRegex, emptyError: .emailIsRequiere, invalidError: .emailIsNotValid)
    }
    
    func isValidPassword(_ password: String)throws -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d!@#$%^&*(),.?\":{}|<>]{8,}$"
        return try validate(password, with: passwordRegex, emptyError: .passwordIsRequiere, invalidError: .passwordPolicies)
    }
}
