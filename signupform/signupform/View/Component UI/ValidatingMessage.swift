//
//  ValidatingMessage.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/18/24.
//

import SwiftUI

struct ValidatingMessage: View {
    private var message: String?
    private var isError: Bool
    private var validationText: Bool
    
    init(message: String? = nil, isError: Bool, validationText: Bool) {
        self.message = message
        self.isError = isError
        self.validationText = validationText
    }
    
    var body: some View {
        if let message = message {
            Text(message)
                .foregroundStyle(isError ? .green : .red)
                .font(validationText ? .headline : .callout)
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
    ValidatingMessage(message: "Test text", isError: false, validationText: false)
}
