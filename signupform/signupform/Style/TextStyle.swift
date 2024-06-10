//
//  TextStyle.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

struct AnnotationTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.blue)
            .font( .system(.subheadline, weight: .black) )
            .kerning(1)
            .frame(width: 145)
    }
}

struct NormalTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.blue)
            .font(.system(.body, weight: .heavy))
            .kerning(2)
    }
}

struct SubtitleTextStyle: ViewModifier {
    var maxWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.blue)
            .font( .system(.callout, weight: .heavy ) )
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .kerning(1)
            .frame(maxWidth: maxWidth)
    }
}

struct TitleTextStyle: ViewModifier {
    var maxWight: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.blue)
            .font( .system(.largeTitle, weight: .semibold) )
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .kerning(2)
            .frame(maxWidth: maxWight)
    }
}

extension View {
    func annotationTextStyle() -> some View {
        self.modifier(AnnotationTextStyle())
    }
    
    func normalTextStyle() -> some View {
        self.modifier(NormalTextStyle())
    }

    func subtitleTextStyle(maxWidth: CGFloat = 300) -> some View {
        self.modifier(SubtitleTextStyle(maxWidth: maxWidth))
    }

    func titleTextStyle(maxWidth: CGFloat = 300) -> some View {
        self.modifier(TitleTextStyle(maxWight: maxWidth))
    }
}
