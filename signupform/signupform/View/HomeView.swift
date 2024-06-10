//
//  HomeView.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

struct HomeView: View {
    @Bindable private var homeViewModel: HomeViewModel
    
    init(_ homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    HomeView(HomeViewModel(HomeCoordinator(AppCoordinator())))
}
