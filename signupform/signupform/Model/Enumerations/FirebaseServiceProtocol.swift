//
//  FirebaseServiceProtocol.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/5/24.
//

import Foundation
import Firebase
import FirebaseAuth

protocol FirebaseServiceProtocol {
    func currentUser() -> User?
    func logIn(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void)
    func createAccount(fullname: String, email: String, password: String, completion: @escaping(Result<User, Error>) -> Void)
    func forgotPassword(email: String, completion: @escaping(Error?) -> Void)
    func signOut()
}
