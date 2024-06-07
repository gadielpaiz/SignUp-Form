//
//  DataService.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/7/24.
//

import Foundation
import SwiftData

final class DataService: DataProtocol {
    // Singleton
    static let shared = DataService()
    private init() {}
    
    var inMemory = false
    
    lazy var container: ModelContainer = {
        setupContainer()
    }()
    
    private func setupContainer() -> ModelContainer {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: inMemory)
             return try ModelContainer(for: UserModel.self, configurations: configuration)
        } catch {
            CrashlyticsService.logError(error)
            fatalError("Could not create the database on this device.")
        }
    }
    
    func deleteModel() throws {
        let context = ModelContext(container)
        try context.delete(model: UserModel.self)
    }
    
    func testDataBase() {
        var user: UserModel {
            UserModel(
                id: "u" + String(Int.random(in: 0...100)),
                fullname: "a b",
                email: "a@b.com"
            )
        }
        let userRepository = UserRepository()
        do {
            func printUserAfterOperation(_ operation: () throws -> Void) throws {
                try operation()
                let user = try userRepository.fetchAllUsers()
                print("User: \(user)")
            }
            
            // Execute the sequece of operation with the same user object
            try printUserAfterOperation {}
            try printUserAfterOperation { try self.deleteModel() }
            try printUserAfterOperation { try userRepository.createUser(user) }
            try printUserAfterOperation { try userRepository.createUser(user) }
        } catch {
            CrashlyticsService.logError(error)
            print("Error on testDateBase: \(error.localizedDescription)")
        }
    }
}

extension DataService: Identifiable, Equatable {
    static func ==(lhs: DataService, rhs: DataService) -> Bool {
        lhs.id == rhs.id
    }
}
