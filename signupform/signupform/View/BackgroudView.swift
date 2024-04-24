//
//  Backgroud.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct BackgroudView: View {
    let firstColor: Color
    let secondColor: Color
    let thirdColor: Color
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [firstColor.opacity(0.8), secondColor.opacity(0.8), thirdColor.opacity(0.8)]), startPoint: startPoint, endPoint: endPoint)
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroudView(firstColor: .blue, secondColor: .purple, thirdColor: .orange, startPoint: .topLeading, endPoint: .bottomTrailing)
}
