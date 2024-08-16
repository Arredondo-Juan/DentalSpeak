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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(flashcardViewModel)
                .preferredColorScheme(.light)
        }
    }
}

