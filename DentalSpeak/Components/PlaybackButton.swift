//
//  PlaybackButton.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct PlaybackButton: View {
    var text: String

    var body: some View {
        Button(action: {
            SpeechSynthesizerManager.shared.speak(text)
        }) {
            Image(systemName: "speaker.wave.2.fill")
                .padding(.top, 10)
        }
    }
}

#Preview {
    PlaybackButton(text: "Dentist")
}
