//
//  FlashcardListView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct FlashcardListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    var deckType: DeckType
    @State private var flashcards: [Flashcard] = []
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(.blue), Color(.white)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                if flashcards.isEmpty {
                    Text("No cards available")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    if currentIndex < flashcards.count {
                        DraggableCardView(flashcards: $flashcards, flashcard: flashcards[currentIndex])
                            .onDisappear {
                                currentIndex += 1
                            }
                        
                        // Display number of cards left
                        Text("Cards left: \(flashcards.count - currentIndex)")
                            .font(.headline)
                            .padding(.top)
                    } else {
                        Text("You've gone through all the cards!")
                            .font(.headline)
                            .padding()
                    }
                }
            }
            .onAppear {
                loadFlashcards()
                flashcards.shuffle() // Randomize flashcards
            }
            .navigationTitle(deckType.rawValue)
        }
    }
    
    private func loadFlashcards() {
        switch deckType {
        case .terms:
            flashcards = viewModel.termsDeck
        case .phrases:
            flashcards = viewModel.phrasesDeck
        case .saved:
            flashcards = viewModel.savedDeck
        }
    }
}


#Preview {
    FlashcardListView(deckType: .terms)
        .environmentObject(FlashcardViewModel())
}
