//
//  ViewFactory.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

final class ViewFactory {
    private let coordinator: AppCoordinator
    
    init(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    @ViewBuilder
    func view(for screen: AppViews) -> some View {
        switch screen {
        case .home:
            HomeCoordinator(coordinator).show()
        case .landing:
            LandingCoordinator(coordinator).show()
        case .loading:
            Text("Loading")
        }
    }
}
