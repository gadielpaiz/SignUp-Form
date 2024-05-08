//
//  ValidatingButton.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/18/24.
//

import SwiftUI

struct ValidatingButton: View {
    private let buttonName: String
    private let action: () -> Void
    private let color: Color
    private let maxWidth: CGFloat
    private let maxHeight: CGFloat
    
    init(buttonName: String, action: @escaping () -> Void, color: Color, maxWidth: CGFloat, maxHeight: CGFloat) {
        self.buttonName = buttonName
        self.action = action
        self.color = color
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
  
    
    var body: some View {
        Button(buttonName, action: action)
        .buttonStyle(GradientButtonStyle(color: color, maxWidth: maxWidth, maxHeight: maxHeight))
        .padding(.vertical, 10)
    }
}

#Preview {
    ValidatingButton(buttonName: "Hello", action: {}, color: .red, maxWidth: 100, maxHeight: 50)
}
