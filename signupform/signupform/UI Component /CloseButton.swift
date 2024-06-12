//
//  CloseButton.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

struct CloseButton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 25, weight: .black))
                    .foregroundStyle(.buttonLetters.gradient.opacity(0.7))
                    .padding(Constants.paddingForCloseButton)
            }
        }
    }
}

#Preview {
    CloseButton()
}
