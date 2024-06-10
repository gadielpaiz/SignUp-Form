//
//  TextFieldStyle.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/2/24.
//

import SwiftUI

struct GradientBorderStyle: TextFieldStyle {
    let color1: Color
    let color2: Color
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.all, 10)
            .font(.system(.headline, design: .rounded, weight: .bold))
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .background(
                LinearGradient(gradient: Gradient(colors: [color1.opacity(0.7), color2.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
            )
            .overlay(
                RoundedRectangle(cornerRadius:  5)
                    .stroke(.black.gradient.opacity(0.7), lineWidth: 2)
            )
    }
}
