//
//  HomeScreen.swift
//  signupform
//
//  Created by Gadiel Paiz on 5/21/24.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        TabView {
            SignUpView()
                .tabItem {
                    Image(systemName: "person.badge.key.fill")
                    Text("Sign Up")
                }
            
            SignInView()
                .tabItem {
                    Image(systemName: "door.left.hand.open")
                    Text("Sign In")
                }
        }
        .tableStyle(.inset)
    }
}

#Preview {
    HomeScreenView()
}
