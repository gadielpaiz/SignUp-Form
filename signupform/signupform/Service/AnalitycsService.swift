//
//  AnalitycsService.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import Foundation
import FirebaseAnalytics
import FirebaseAuth

final class AnalitycsService {
    static func logEvent(_ event: String, parameters: [String : Any]? = nil) {
        Analytics.logEvent(event, parameters: parameters)
    }
    
    static func currentScreenView(_ screen: String) {
        logEvent(AnalyticsEventScreenView, parameters:[AnalyticsParameterScreenName : screen])
    }
    
    static func specialScreenView(_ screen: String) {
        logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName : screen])
    }
    
    static func logInUser() {
        if let user = Auth.auth().currentUser,
           let email = user.email,
           let fullname = user.displayName {
            CrashlyticsService.setUserId(user.uid)
            Analytics.setUserID(user.uid)
            Analytics.setUserProperty("email", forName: email)
            Analytics.setUserProperty("fullName", forName: fullname)
            logEvent(
                AnalyticsEventLogin,
                parameters: [AnalyticsParameterStartDate: Date()]
            )
        }
    }
    
    static func logOut() {
        logEvent(AnalyticsEventSignUp, parameters: [AnalyticsParameterEndDate : Date()])
    }
}
