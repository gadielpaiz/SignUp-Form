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
    private let colorFont: Color
    private let maxWidth: CGFloat
    private let maxHeight: CGFloat
    
    
    init(_ action: @escaping () -> Void, colorButton: Color, colorFont: Color, maxWidth: CGFloat, maxHeight: CGFloat) {
        self.action = action
        self.colorButton = colorButton
        self.colorFont = colorFont
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
    
    var body: some View {
        Button("Submit", action: action)
        .buttonStyle(GradientButtonStyle(color: colorButton, maxWidth: maxWidth, maxHeight: maxHeight))
        .padding(.vertical, 10)
        .foregroundStyle(.white)
    }
}

#Preview {
    ValidatingButton({}, colorButton: .blue, colorFont: .white, maxWidth: 100, maxHeight: 50)
}
