//
//  signupformApp.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import SwiftData
import SwiftUI

@main
struct signupformApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.currentView
        }
    }
}
