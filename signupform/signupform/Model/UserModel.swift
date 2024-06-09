//
//  UserModel.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/5/24.
//

import Foundation
import SwiftData

@Model
final class UserModel: Codable {
    // identification
    @Attribute(.unique)
    var id: String
    var name: String
    
    // c
    var signUpType: SignUpType
    var secondName: String
    var surname: String
    var secondSurname: String
    var email: String
    
    // log
    var notes: String
    let createdAt: Date
    var updatedAt: Date
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case sign_up_type
        case second_name
        case surname
        case second_surname
        case email
        case notes
        case created_at
        case updated_at
    }
    
    init(
        id: String,
        name: String,
        signUpType: SignUpType = .email,
        secondName: String = "",
        surname: String = "",
        secondSurname: String = "",
        email: String,
        notes: String = "",
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.signUpType = signUpType
        self.secondName = secondName
        self.surname = surname
        self.secondSurname = secondSurname
        self.email = email
        self.notes = notes
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.signUpType = try container.decode(SignUpType.self, forKey: .sign_up_type)
        self.secondName = try container.decode(String.self, forKey: .second_name)
        self.surname = try container.decode(String.self, forKey: .surname)
        self.secondSurname = try container.decode(String.self, forKey: .second_surname)
        self.email = try container.decode(String.self, forKey: .email)
        self.notes = try container.decode(String.self, forKey: .notes)
        self.createdAt = try container.decode(Date.self, forKey: .created_at)
        self.updatedAt = try container.decode(Date.self, forKey: .updated_at)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(signUpType, forKey: .sign_up_type)
        try container.encode(secondName, forKey: .second_name)
        try container.encode(surname, forKey: .surname)
        try container.encode(secondSurname, forKey: .second_surname)
        try container.encode(email, forKey: .email)
        try container.encode(notes, forKey: .notes)
        try container.encode(createdAt, forKey: .created_at)
        try container.encode(updatedAt, forKey: .updated_at)

    }
    
    convenience init(id: String = "", fullname: String, email: String) {
        let parts = fullname.split(separator: " ").map(String.init)
        let name = parts.first ?? ""
        let surname = parts.count > 1 ? parts[1] : ""
        
        self.init(id: id, name: name, surname: surname, email: email)
    }
    
    func getFullname() -> String {
        return "\(name) \(surname)"
    }
}

extension UserModel {
    func toDictionary() -> [String : Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else {
                return nil
            }
            return dictionary
        } catch {
            print("Error to convert to dictionary the model: UserModel")
            CrashlyticsService.logError(error)
            return nil
        }
    }
}
