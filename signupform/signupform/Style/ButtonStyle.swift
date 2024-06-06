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
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .foregroundStyle(.buttonLetters)
            .padding(.vertical, 15)
            .background(color.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .kerning(2)
            .shadow(color: .gray,radius: 3, x: 3, y: 3)
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .opacity(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.3), value: configuration.isPressed)
    }
}

struct SocialButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font( .system(size: 40) )
            .foregroundStyle((configuration.isPressed ? Color.cyan : Color.blue).gradient)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
    }
}

struct TextButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(.subheadline, weight: .regular))
            .kerning(1)
            .foregroundStyle(.buttonLetters.gradient)
            .frame(minWidth: 0, idealWidth: .infinity)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background((configuration.isPressed ? Color.cyan : Color.blue).gradient)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
