//
//  ValidatingMessage.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/18/24.
//

import SwiftUI

struct ValidatingMessage: View {
    private let message: String?
    private var isError = false
    private var isValidationText = false
    
    init(_ message: String?, isError: Bool = false, isValidationText: Bool = false) {
        self.message = message
        self.isError = isError
        self.isValidationText = isValidationText
    }
    
    var body: some View {
        if let message = message {
            Text(LocalizedStringKey(message))
                .foregroundStyle(isError ? .green : .red)
                .font(isValidationText ? .headline : .callout)
                .offset(y: 8)
                .padding(.vertical, 10)
        } else {
            Text("invisible text")
                .opacity(0)
                .offset(y: 8)
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    ValidatingMessage("btn_sign_in_access", isError: false, isValidationText: false)
}
