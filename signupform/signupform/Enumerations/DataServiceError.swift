//
//  DataServiceError.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/7/24.
//

import Foundation

enum DataServiceError: Error {
    // General
    case deleteModel
    
    // User
    case createUser
    case readUser
    case updateUser
    case deleteUser
    case userNotFound
}
