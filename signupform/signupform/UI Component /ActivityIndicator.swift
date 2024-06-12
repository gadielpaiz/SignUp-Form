//
//  ActivityIndicator.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/2/24.
//

import SwiftUI

struct ActivityIndicator: View {
    @State private var positions: [CGPoint] = Array(repeating: .zero, count: 10)
    @State private var rotations: [Double] = Array(repeating: 0, count: 10)
    var message = "Hello, World!"
    
    let symbols: [SymbolData] = [
        SymbolData(name: "plus.circle.fill", color: .random, rotationSpeed: 2, isReverse: false),
        SymbolData(name: "minus.rectangle.fill", color: .random, rotationSpeed: 3, isReverse: true),
        SymbolData(name: "xmark.seal.fill", color: .random, rotationSpeed: 4, isReverse: false),
        SymbolData(name: "divide", color: .random, rotationSpeed: 5, isReverse: true),
        SymbolData(name: "arrowshape.left.arrowshape.right.fill", color: .random, rotationSpeed: 6, isReverse: false),
        SymbolData(name: "arrowshape.forward.fill", color: .random, rotationSpeed: 7, isReverse: true),
        SymbolData(name: "equal.circle", color: .random, rotationSpeed: 8, isReverse: false)
    ]
    
    struct SymbolData {
        let name: String
        let color: Color
        let rotationSpeed: Double
        let isReverse: Bool
    }
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<symbols.count, id: \.self) { index in
                    Image(systemName: symbols[index].name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(symbols[index].color)
                        .position(positions[index])
                        .rotationEffect(.degrees(symbols[index].isReverse ? -rotations[index] : rotations[index]))
                        .onAppear {
                            withAnimation(Animation.linear(duration: symbols[index].rotationSpeed).repeatForever(autoreverses: false)) {
                                rotations[index] = 360
                            }
                            withAnimation(Animation.easeInOut(duration: Double.random(in: 3...6)).repeatForever(autoreverses: true)) {
                                positions[index] = CGPoint(x: CGFloat.random(in: 0...300), y: CGFloat.random(in: 0...600))
                            }
                        }
                }
                
                
                Text(LocalizedStringKey(message))
                    .foregroundStyle(.blue.shadow(.inner(radius: 20)))
                    .kerning(3)
                Text(LocalizedStringKey(message))
                    .foregroundStyle(.cyan)
                    .offset(x: 1, y: -1)
                    .kerning(3)
            }
            .font(.system(size: 22, weight: .semibold, design: .monospaced))
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .padding()
        }
        .presentationBackground(.blue.opacity(0.75).shadow(.inner(radius: 20)))

    }
}


#Preview {
    ActivityIndicator()
}

fileprivate extension Color {
    static var random: Color {
        var colors: [Color] = [.accentColor, .green, .yellow, .orange, .purple, .black, .brown, .cyan, .gray, .indigo, .pink, .mint, .red, .teal, .primary, .secondary]
        var usedColors: Set<Color> = []
        
        //the color array was emptied, so reload
        if colors.isEmpty {
            colors = Array(usedColors)
            usedColors.removeAll()
        }
        
        guard let selectColor = colors.randomElement() else { return .blue }
        usedColors.insert(selectColor)
        colors.removeAll { $0 == selectColor }
        return selectColor.opacity(0.75)
    }
}
