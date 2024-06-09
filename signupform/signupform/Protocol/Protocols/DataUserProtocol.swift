//
//  DataUserProtocol.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/5/24.
//

import Foundation

protocol DataUserProtocol {
    func createUser(_ user: UserModel) throws
    func readUserBy(id: String)throws -> UserModel?
    func readUserBy(model user: UserModel) throws -> UserModel?
    func updateUser(_ user: UserModel) throws
    func deleteUserBy(id: String) throws
    func deleteUserBy(model user: UserModel) throws
    func fetchAllUsers() throws -> [UserModel]
}
