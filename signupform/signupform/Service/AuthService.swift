//
//  AuthService.swift
//  signupform
//
//  Created by Gadiel Paiz on 6/7/24.
//

import Combine
import Firebase
import FirebaseAuth

final class AuthService {
    static let shared = AuthService()
    private init() {}
    
    func currentLogin() -> Bool {
        Auth.auth().currentUser != nil
    }
    
    func signUp(user: UserModel, password: String) -> AnyPublisher<UserModel, FirebaseServiceError> {
        Deferred {
            Future { promise in
                Auth.auth().createUser(withEmail: user.email, password: password) {authResult, error in
                    if let error = error {
                        if (error as NSError).code == 17007 {
                            promise(.failure(.signUpEmailUsed))
                        } else {
                            promise(.failure(.errorSignUp))
                        }
                        return
                    }
                    
                    guard let newUser = authResult?.user else {
                        promise(.failure(.errorRetrievingTheUser))
                        return
                    }
                    let changeRequest = newUser.createProfileChangeRequest()
                    changeRequest.displayName = user.getFullname()
                    changeRequest.commitChanges { error in
                        if let _ = error {
                            promise(.failure(.errorUpdatingTheUser))
                            return
                        }
                    }
                    
                    user.id = newUser.uid
                    promise(.success(user))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<UserModel, FirebaseServiceError> {
        Deferred {
            Future { promise in
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        switch (error as NSError).code {
                        case 17004:
                            promise(.failure(.signInInvalidCredential))
                        case 17005:
                            promise(.failure(.signInUserDisabled))
                        default:
                            promise(.failure(.errorRetrievingTheUser))
                        }
                        return
                    } else {
                        guard let user = authResult?.user,
                              let fullname = user.displayName,
                              let email = user.email else {
                            promise(.failure(.errorRetrievingTheUser))
                            return
                        }
                        let userModel = UserModel(id: user.uid, fullname: fullname, email: email)
                        
                        promise(.success(userModel))
                    }
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func signOut() -> AnyPublisher<Bool, FirebaseServiceError> {
        Deferred {
            Future { promise in
                do {
                    try Auth.auth().signOut()
                    promise(.success(true))
                } catch {
                    CrashlyticsService.logError(error)
                    promise(.failure(.errorSignOut))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func forgotPassword(_ email: String) -> AnyPublisher<Bool, FirebaseServiceError> {
        Deferred {
            Future { promise in
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        print("Error: \(error)")
                        promise(.failure(.errorForgotPassword))
                    }
                    promise(.success(true))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
