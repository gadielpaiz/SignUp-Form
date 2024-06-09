//
//  ValidatingTextField.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/18/24.
//

import SwiftUI

struct ValidatingField: View {
    private var title: String
    private var text: Binding<String>
    private var gradientColor: ( color1: Color, color2: Color)
    private var needsSecurity: Bool
    private var maxWidth: CGFloat
    private var maxHeight: CGFloat
    
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
            SecureField(title, text: text)
                .textFieldStyle(
                    GradientBorderStyle(
                        color1: gradientColor.color1,
                        color2: gradientColor.color2,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight
                    )
                )
                .offset(y: 8)
            
        } else {
            TextField(title, text: text)
                .textFieldStyle(
                    GradientBorderStyle(
                        color1: gradientColor.color1,
                        color2: gradientColor.color2,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight
                    )
                )
                .offset(y: 8)
        }
    }
}

#Preview {
    ValidatingField(
        "Full name",
        text: .constant(""),
        gradientColor: (.black, .gray),
        needsSecurity: true,
        maxWidth: 370,
        maxHeight: 40
    )
}
