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
    @Published var favoritesDeck: [Flashcard] = [] // New property to track favorite flashcards
    
    @AppStorage("savedFlashcardTermsString") private var savedFlashcardTermsString: String = ""
    @AppStorage("favoriteFlashcardTermsString") private var favoriteFlashcardTermsString: String = ""
    
    init() {
        loadFlashcards()
        loadSavedFlashcards()
        loadFavoriteFlashcards()
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
    
    func loadFavoriteFlashcards() {
        if let data = favoriteFlashcardTermsString.data(using: .utf8) {
            do {
                let favoriteTerms = try JSONDecoder().decode([String].self, from: data)
                favoritesDeck = termsDeck.filter { favoriteTerms.contains($0.term) } +
                phrasesDeck.filter { favoriteTerms.contains($0.term) }
            } catch {
                print("Error decoding favorite flashcard terms: \(error)")
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
    
    func toggleFavorite(_ flashcard: Flashcard) {
        if let index = favoritesDeck.firstIndex(of: flashcard) {
            favoritesDeck.remove(at: index)
        } else {
            favoritesDeck.append(flashcard)
        }
        updateFavoriteFlashcardsStorage()
    }
    
    func updateSavedFlashcardsStorage() {
        let savedTerms = savedDeck.map { $0.term }
        if let encodedData = try? JSONEncoder().encode(savedTerms),
           let jsonString = String(data: encodedData, encoding: .utf8) {
            savedFlashcardTermsString = jsonString
        }
    }
    
    func updateFavoriteFlashcardsStorage() {
        let favoriteTerms = favoritesDeck.map { $0.term }
        if let encodedData = try? JSONEncoder().encode(favoriteTerms),
           let jsonString = String(data: encodedData, encoding: .utf8) {
            favoriteFlashcardTermsString = jsonString
        }
    }
    
    func isFlashcardSaved(_ flashcard: Flashcard) -> Bool {
        return savedDeck.contains(flashcard)
    }
    
    func isFlashcardFavorited(_ flashcard: Flashcard) -> Bool {
        return favoritesDeck.contains(flashcard)
    }
    
    func moveFlashcardToBack(_ flashcard: Flashcard) {
        if let index = savedDeck.firstIndex(of: flashcard) {
            let card = savedDeck.remove(at: index)
            savedDeck.append(card)
        }
    }
    
    func speak(_ text: String) {
        SpeechSynthesizerManager.shared.speak(text)
    }
}
