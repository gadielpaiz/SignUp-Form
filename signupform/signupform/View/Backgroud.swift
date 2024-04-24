//
//  Backgroud.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct Backgroud: View {
    let colorLeading: Color
    let colorTrailing: Color
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [colorLeading.opacity(0.5), colorTrailing.opacity(0.5)]), startPoint: startPoint, endPoint: endPoint)
            .ignoresSafeArea(.all)
    }
}

#Preview {
    Backgroud(colorLeading: .blue, colorTrailing: .purple,startPoint: .topLeading, endPoint: .bottomTrailing)
}
