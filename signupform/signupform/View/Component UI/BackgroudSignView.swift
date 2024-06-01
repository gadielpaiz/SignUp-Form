//
//  Backgroud.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftUI

struct BackgroudSignView: View {
    
    var body: some View {
        VStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Circle()
                        .scale(1.97)
                        .foregroundStyle(.white.opacity(0.15))
                    
                    Circle()
                        .scale(1.75)
                        .foregroundStyle(.white.opacity(0.30))
                    Circle()
                        .scale(1.54)
                        .foregroundStyle(.white)
                    
                } else if UIDevice.current.userInterfaceIdiom == .pad {
                    Circle()
                        .scale(1.37)
                        .foregroundStyle(.white.opacity(0.15))
                    
                    Circle()
                        .scale(1.25)
                        .foregroundStyle(.white.opacity(0.30))
                    Circle()
                        .scale(1.13)
                        .foregroundStyle(.white.opacity(0.45))
                    Circle()
                        .scale(0.98)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    BackgroudSignView()
}
