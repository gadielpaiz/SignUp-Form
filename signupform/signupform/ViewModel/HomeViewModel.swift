//
//  HomeViewModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import Foundation
import Observation

final class HomeViewModel {
    
    private var currentUser: UserModel?
    
    init() {
        self.currentUser = UserRepository().getCurrentUser()
    }
    
    func logOut() {
        let _ = AuthRepository().signOut()
            .sink { completion in
                switch completion {
                case .finished:
                    AnalyticsService.logOut()
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { _ in }
    }
}
