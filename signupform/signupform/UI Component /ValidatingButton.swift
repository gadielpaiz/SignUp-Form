//
//  ValidatingButton.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/18/24.
//

import SwiftUI

struct ValidatingButton: View {
    private let action: () -> Void
    private let colorButton: Color
    private let maxWidth: CGFloat
    private let maxHeight: CGFloat
    private let buttonName: String
   
    init(_ action: @escaping () -> Void, colorButton: Color, maxWidth: CGFloat, maxHeight: CGFloat, buttonName: String) {
        self.action = action
        self.colorButton = colorButton
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.buttonName = buttonName
    }

    var body: some View {
        Button(LocalizedStringKey(buttonName), action: action)
            .buttonStyle(GradientButtonStyle(color: colorButton, maxWidth: maxWidth, maxHeight: maxHeight))
        .padding(.vertical, 10)
    }
}

#Preview {
    ValidatingButton({}, colorButton: .blue, maxWidth: .infinity, maxHeight: 50, buttonName: "btn_sign_up_create_account")
}
