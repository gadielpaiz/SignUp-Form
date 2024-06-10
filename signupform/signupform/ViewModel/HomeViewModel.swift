//
//  HomeViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import Foundation
import Observation

@Observable
final class HomeViewModel {
    private let coordinator: HomeCoordinator
    private var currentUser: UserModel?
    
    init(_ coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        self.currentUser = UserRepository().getCurrentUser()
    }
    
    func logOut() {
        let _ = AuthRepository().signOut()
            .sink { completion in
                switch completion {
                case .finished:
                    AnalyticsService.logOut()
                    self.coordinator.appCoordinator.navigate(to: .landing)
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { _ in }
    }
}
