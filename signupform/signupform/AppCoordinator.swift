//
//  AppCoordinator.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import Observation
import SwiftData
import SwiftUI

final class AppCoordinator {
    private var currentScreen: AppViews
    private var viewFactory: ViewFactory {
        ViewFactory(self)
    }
    
    init() {
        currentScreen = .landing
    }
    
    var currentView: some View {
        return viewFactory.view(for: currentScreen)
            .modelContainer(DataService.shared.container)
    }
    
    func navigate(to view: AppViews) {
        self.currentScreen = view
    }
}
