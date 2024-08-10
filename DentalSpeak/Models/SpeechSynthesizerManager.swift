//
//  SpeechSynthesizerManager.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import Foundation
import AVFoundation

class SpeechSynthesizerManager: NSObject, AVSpeechSynthesizerDelegate {
    static let shared = SpeechSynthesizerManager()
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    private override init() {
        super.init()
        speechSynthesizer.delegate = self
    }
    
    func speak(_ text: String, language: String = "es-MX") {
        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        speechSynthesizer.speak(utterance)
    }
}
