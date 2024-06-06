//
//  TitleAndSubtitle.swift
//  signupform
// like a dog
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

struct TitleAndSubtitle: View {
    let title: String
    let subtitle: String
    var maxWidth: CGFloat = 300
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(LocalizedStringKey(title))
                .titleTextStyle(maxWidth: maxWidth)
            
            Text(LocalizedStringKey(subtitle))
                .subtitleTextStyle(maxWidth: maxWidth)
        }
        .padding(.top, 10)
    }
}

#Preview {
    TitleAndSubtitle(title: "This is long, very long text for multiline testing.", subtitle: "This is long, very long text for multiline testing.")
}
