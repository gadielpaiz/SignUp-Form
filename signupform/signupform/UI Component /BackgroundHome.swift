//
//  BackgroundHomeView.swift
//  signupform
//
//  Created by Gadiel Paiz on 5/23/24.
//

import SwiftUI

struct BackgroundHome: View {
    private var iphoneScaleFirst: CGFloat
    private var iphoneScaleSecond: CGFloat
    
    init(iphoneScaleFirst: CGFloat, iphoneScaleSecond: CGFloat) {
        self.iphoneScaleFirst = iphoneScaleFirst
        self.iphoneScaleSecond = iphoneScaleSecond
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                if UIDevice.current.userInterfaceIdiom == .phone {
                    RoundedRectangle(cornerRadius: 24)
                        .scale(iphoneScaleFirst)
                        .foregroundStyle(.white.opacity(0.45))
                    
                    RoundedRectangle(cornerRadius: 24)
                        .scale(iphoneScaleSecond)
                        .foregroundStyle(.white)
                    
                } else if UIDevice.current.userInterfaceIdiom == .pad {
                    RoundedRectangle(cornerRadius: 24)
                        .scale(0.98)
                        .foregroundStyle(.white.opacity(0.15))
                    
                    RoundedRectangle(cornerRadius: 24)
                        .scale(0.93)
                        .foregroundStyle(.white.opacity(0.30))
                    
                    RoundedRectangle(cornerRadius: 24)
                        .scale(0.86)
                        .foregroundStyle(.white.opacity(0.45))
                    
                    RoundedRectangle(cornerRadius: 24)
                        .scale(0.79)
                        .foregroundStyle(.white)
                }                
            }
        }
    }
}

#Preview {
    BackgroundHome(iphoneScaleFirst: 0.98, iphoneScaleSecond: 0.9)
}
