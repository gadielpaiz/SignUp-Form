//
//  ValidatingTextField.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/18/24.
//

import SwiftUI

struct ValidatingField: View {
    private let title: String
    private var text: Binding<String>
    private let gradientColor: ( color1: Color, color2: Color)
    private let fontColor: Color
    private var needsSecurity: Bool
    private let maxWidth: CGFloat
    private let maxHeight: CGFloat
    
    init(_ title: String, text: Binding<String>, gradientColor: (color1: Color, color2: Color), fontColor: Color, needsSecurity: Bool, maxWidth: CGFloat, maxHeight: CGFloat) {
        self.title = title
        self.text = text
        self.gradientColor = gradientColor
        self.fontColor = fontColor
        self.needsSecurity = needsSecurity
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
    
    var body: some View {
        if needsSecurity {
            SecureField(title, text: text)
                .foregroundStyle(.blue)
                .textFieldStyle(
                    GradientBorderStyle(
                        color1: gradientColor.color1,
                        color2: gradientColor.color2,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight
                    )
                )
                .offset(y: 8)
                .autocorrectionDisabled()
            
        } else {
            TextField(title, text: text)
                .foregroundStyle(fontColor)
                .textFieldStyle(
                    GradientBorderStyle(
                        color1: gradientColor.color1,
                        color2: gradientColor.color2,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight
                    )
                )
                .offset(y: 8)
                .autocorrectionDisabled()
        }
    }
}

#Preview {
    ValidatingField(
        "Full name",
        text: .constant(""),
        gradientColor: (.black, .gray), 
        fontColor: .blue,
        needsSecurity: true,
        maxWidth: 370,
        maxHeight: 40
    )
}
