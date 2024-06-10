//
//  File.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 5) {
            ZStack(alignment: .center) {
                Image(systemName: "rectangle")
                    .font(.system(size: 15))
                    .foregroundStyle(.cyan)
                    .onTapGesture {
                        configuration.isOn.toggle()
                    }
                    .offset(y: 1)
                
                if configuration.isOn {
                    Image(systemName: "checkmark")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundStyle(configuration.isOn ? .blue : .clear)
                        .onTapGesture {
                            configuration.isOn.toggle()
                        }
                        .offset(x: 3, y: -2)
                }
            }
            
            configuration.label
                .font(.subheadline)
                .fontWeight(.light)
                .kerning(1)
                .foregroundColor(.blue)
                .shadow(color: .gray.opacity(0.5), radius: 2, x: 3, y: 3)
        }
    }
}
