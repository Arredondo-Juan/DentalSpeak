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
                    ZStack {
                        ForEach(Array(flashcards.enumerated()), id: \.element.id) { index, flashcard in
                            DraggableCardView(flashcards: $flashcards, flashcard: flashcard)
                        }
                    }
                    .padding()
                    
                    Text("Cards left: \(flashcards.count)")
                        .font(.headline)
                        .padding(.top)
                }
            }
            .onAppear {
                loadFlashcards()
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
