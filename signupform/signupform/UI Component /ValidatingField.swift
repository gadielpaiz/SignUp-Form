//
//  ValidatingField.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/2/24.
//

import SwiftUI

struct ValidatingField: View {
    private let title: String
    private var text: Binding<String>
    private let gradientColor: ( color1: Color, color2: Color)
    private var needsSecurity: Bool
    private let maxWidth: CGFloat
    private let maxHeight: CGFloat
    
    init(_ title: String, text: Binding<String>, gradientColor: (color1: Color, color2: Color), needsSecurity: Bool, maxWidth: CGFloat, maxHeight: CGFloat) {
        self.title = title
        self.text = text
        self.gradientColor = gradientColor
        self.needsSecurity = needsSecurity
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
    
    var body: some View {
        if needsSecurity {
            SecureField(LocalizedStringKey(title), text: text)
                .foregroundStyle(.white)
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
            TextField(LocalizedStringKey(title), text: text)
                .foregroundStyle(.white)
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
        "placeholder_email",
        text: .constant(""),
        gradientColor: (.blue, .blue),
        needsSecurity: true,
        maxWidth: 350,
        maxHeight: 50
    )
}
