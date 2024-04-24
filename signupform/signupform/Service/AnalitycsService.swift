//
//  AnalitycsService.swift
//  signupform
//
//  Created by Gadiel Paiz on 4/17/24.
//

import Foundation
import FirebaseAnalytics

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
}
