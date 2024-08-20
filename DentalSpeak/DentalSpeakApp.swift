//
//  DentalSpeakApp.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

@main
struct DentalSpeakApp: App {
    
    @StateObject private var flashcardViewModel = FlashcardViewModel()
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            
            if needsOnboarding == true {
                OnboardingView()
                    .preferredColorScheme(.light)
            } else {
                ContentView()
                    .environmentObject(flashcardViewModel)
                    .preferredColorScheme(.light)
            }
            
        }
    }
}
