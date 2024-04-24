//
//  GradientButtonStyle.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    let color: Color
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(.headline, design: .rounded, weight: .medium))
            .frame(maxWidth: maxWidth , maxHeight: maxHeight)
            .background(color.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 0.5)
                )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.3), value: configuration.isPressed)
    }
}
