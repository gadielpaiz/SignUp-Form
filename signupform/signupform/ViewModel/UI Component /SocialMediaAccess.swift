//
//  SocialMediaAccess.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/1/24.
//

import SwiftUI

struct SocialMediaAccess: View {
    var body: some View {
        VStack {
            // text
            HStack(spacing: 20) {
                Rectangle()
                    .rectangleToLineStyle()
                
                Text("social_media_text")
                    .annotationTextStyle()
                
                Rectangle()
                    .rectangleToLineStyle()
            }
            
            // icons
            
            HStack(spacing: 30) {
                Button(action: { }) { Image(systemName: "apple.logo") }
                Button(action: { }) { Image(systemName: "f.circle.fill") }
                Button(action: { }) { Image(systemName: "g.circle.fill")}
            }
            .buttonStyle(SocialButtonStyle())
        }
    }
}

#Preview {
    SocialMediaAccess()
}
