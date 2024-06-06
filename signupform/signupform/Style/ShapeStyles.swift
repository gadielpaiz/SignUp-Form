//
//  ShapeStyles.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

struct RectangleToLineStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 8)
            .foregroundStyle(.blue)
    }
}

extension View {
    func rectangleToLineStyle() -> some View {
        self.modifier(RectangleToLineStyle())
    }
}
