//
//  GroupStyle.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/2/24.
//

import SwiftUI

struct GroupTextFieldStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding(EdgeInsets(top: 18, leading: 8, bottom: 20, trailing: 10))
            .background(RoundedRectangle(cornerRadius: 8).fill(.blue.opacity(0.9) ) )
    }
}
