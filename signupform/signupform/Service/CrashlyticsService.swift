//
//  CraslitycsService.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import Foundation
import FirebaseCrashlytics

final class CrashlyticsService {
    static func logError(_ error: Error) {
        Crashlytics.crashlytics().record(error: error)
    }
    
    static func setUserId(_ userId: String) {
        Crashlytics.crashlytics().setUserID(userId)
    }
}
