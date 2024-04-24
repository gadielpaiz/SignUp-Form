//
//  GradientBorderStyle.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct GradientBorderStyle: TextFieldStyle {
    let color1: Color
    let color2: Color
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 10)
            .background(
                LinearGradient(gradient: Gradient(colors: [color1.opacity(0.3), color2.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
            )
        
            .overlay(
                RoundedRectangle(cornerRadius:  5)
                    .stroke(.black, lineWidth: 2)
            )
    }
}