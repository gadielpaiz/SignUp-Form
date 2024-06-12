//
//  AppViews.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/9/24.
//

import Foundation

enum AppViews {
    case home
    case landing
    case loading
    
    var name: String {
        switch self {
        case .home:
            "Home"
        case .landing:
            "Landing"
        case .loading:
            "Loading"
        }
    }
}
