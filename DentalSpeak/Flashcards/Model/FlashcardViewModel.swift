//
//  FlashcardViewModel.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

class FlashcardViewModel: ObservableObject {
    @Published var termsDeck: [Flashcard] = []
    @Published var phrasesDeck: [Flashcard] = []
    @Published var savedDeck: [Flashcard] = []
    
    @AppStorage("savedFlashcardTermsString") private var savedFlashcardTermsString: String = ""

    init() {
        loadFlashcards()
        loadSavedFlashcards()
    }
    
    func loadFlashcards() {
        if let url = Bundle.main.url(forResource: "dentalspanishdata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let flashcardData = try JSONDecoder().decode(FlashcardData.self, from: data)
                termsDeck = flashcardData.termsDeck
                phrasesDeck = flashcardData.phrasesDeck
            } catch {
                print("Error loading flashcards: \(error)")
            }
        }
    }
    
    func loadSavedFlashcards() {
        if let data = savedFlashcardTermsString.data(using: .utf8) {
            do {
                let savedTerms = try JSONDecoder().decode([String].self, from: data)
                savedDeck = termsDeck.filter { savedTerms.contains($0.term) } +
                            phrasesDeck.filter { savedTerms.contains($0.term) }
            } catch {
                print("Error decoding saved flashcard terms: \(error)")
            }
        }
    }
    
    func saveFlashcard(_ flashcard: Flashcard) {
        if !savedDeck.contains(flashcard) {
            savedDeck.append(flashcard)
            updateSavedFlashcardsStorage()
        }
    }
    
    func removeFlashcard(_ flashcard: Flashcard) {
        if let index = savedDeck.firstIndex(of: flashcard) {
            savedDeck.remove(at: index)
            updateSavedFlashcardsStorage()
        }
    }
    
    func moveFlashcardToBack(_ flashcard: Flashcard) {
        if let index = savedDeck.firstIndex(of: flashcard) {
            let card = savedDeck.remove(at: index)
            savedDeck.append(card)
        }
    }
    
    func updateSavedFlashcardsStorage() {
        let savedTerms = savedDeck.map { $0.term }
        if let encodedData = try? JSONEncoder().encode(savedTerms),
           let jsonString = String(data: encodedData, encoding: .utf8) {
            savedFlashcardTermsString = jsonString
        }
    }
    
    func isFlashcardSaved(_ flashcard: Flashcard) -> Bool {
        if let data = savedFlashcardTermsString.data(using: .utf8) {
            let savedTerms = (try? JSONDecoder().decode([String].self, from: data)) ?? []
            return savedTerms.contains(flashcard.term)
        }
        return false
    }
    
    func speak(_ text: String) {
        SpeechSynthesizerManager.shared.speak(text)
    }
}
