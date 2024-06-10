//
//  LandingCoordinator.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

final class LandingCoordinator {
    let appCoordinator: AppCoordinator
    
    init(_ appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func show() -> some View {
         LandingView(LandingViewModel(self))
    }
}
