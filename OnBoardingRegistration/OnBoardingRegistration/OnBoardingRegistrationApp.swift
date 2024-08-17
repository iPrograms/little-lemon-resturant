//
//  OnBoardingRegistrationApp.swift
//  OnBoardingRegistration
//
//  Created by Manzoor Ahmed on 7/15/24.
//

import SwiftUI

@main
struct OnBoardingRegistrationApp: App {
    // Attach the environment object
    @StateObject  var userSettings = DefaultStatesData()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
        
            // set user's default settings
            OnBoarding().environmentObject(userSettings)
        }
    }
}
