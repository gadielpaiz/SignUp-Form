//
//  HomeCoordinator.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import SwiftUI

final class HomeCoordinator {
    let appCoordinator: AppCoordinator
    
    init(_ appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func show() -> some View {
        HomeView(HomeViewModel(self))
    }
}
