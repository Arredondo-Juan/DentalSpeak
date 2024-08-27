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
    
    @AppStorage("hasSeenDragFeatureOverlayTerms") private var hasSeenDragFeatureOverlayTerms = false
    @AppStorage("hasSeenDragFeatureOverlayPhrases") private var hasSeenDragFeatureOverlayPhrases = false
    @AppStorage("hasSeenDragFeatureOverlaySaved") private var hasSeenDragFeatureOverlaySaved = false
    @State private var showOverlay: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(.lightBlue), Color(.darkGreen)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            VStack {
                if flashcards.isEmpty {
                    Text("No saved cards")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    if currentIndex < flashcards.count {
                        DraggableCardView(flashcards: $flashcards,
                                          flashcard: flashcards[currentIndex],
                                          isInSavedDeck: deckType == .saved)
                        .onDisappear {
                            currentIndex += 1
                        }
                        
                        if deckType != .saved {
                            
                            HStack(alignment: .center) {
                                Button {
                                    flashcards.sort { $0.term < $1.term }
                                    currentIndex = 0
                                } label: {
                                    Image(systemName: "abc")
                                        .bold()
                                        .frame(width: 50)
                                        .padding()
                                      .foregroundColor(.mainText)
                                      .background(.lightBlue)
                                      .cornerRadius(100)
                                }

                                Button {
                                    flashcards = flashcards.shuffled()
                                    currentIndex = 0
                                } label: {
                                    Image(systemName: "shuffle")
                                        .bold()
                                        .frame(width: 50)
                                        .padding()
                                      .foregroundColor(.mainText)
                                      .background(.lightBlue)
                                      .cornerRadius(100)
                                }
                                
                                Button {
                                    loadFlashcards() // Reload original flashcards
                                    currentIndex = 0
                                } label: {
                                    Image(systemName: "arrow.circlepath")
                                        .bold()
                                        .frame(width: 50)
                                        .padding()
                                      .foregroundColor(.mainText)
                                      .background(.lightBlue)
                                      .cornerRadius(100)
                                }
                                
                            }
                            .padding()
                        }
                        
                        Text("Cards remaining: \(flashcards.count - currentIndex)")
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
                flashcards.shuffle()
                
                switch deckType {
                case .terms:
                    showOverlay = !hasSeenDragFeatureOverlayTerms
                case .phrases:
                    showOverlay = !hasSeenDragFeatureOverlayPhrases
                case .saved:
                    showOverlay = !hasSeenDragFeatureOverlaySaved
                }
            }
            .navigationTitle(deckType.rawValue)
            
            if showOverlay {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                    .overlay(
                        VStack (spacing: 20) {
                            if deckType == .saved {
                                // Saved Deck Overlay Content
                                Text("Swipe left to move the card to the back of the deck and come back to it later.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 40)
                                
                                Text("Swipe right to remove the card from your Saved Deck.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            } else {
                                // Terms/Phrases Deck Overlay Content
                                HStack {
                                    Image("swipeleft")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 140, height: 140)
                                    Spacer()
                                }
                                Text("Swipe left on a flashcard to add it to your Saved Deck.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 40)
                                
                                HStack {
                                    Spacer()
                                    Image("swiperight")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 140, height: 140)
                                }
                                Text("Swipe right on a flashcard to go to the next card.")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                            
                            Button(action: {
                                withAnimation {
                                    showOverlay = false
                                    
                                    switch deckType {
                                    case .terms:
                                        hasSeenDragFeatureOverlayTerms = true
                                    case .phrases:
                                        hasSeenDragFeatureOverlayPhrases = true
                                    case .saved:
                                        hasSeenDragFeatureOverlaySaved = true
                                    }
                                }
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 14)
                                        .foregroundColor(.lightBlue)
                                        .frame(height: 50)
                                    Text("Got it!")
                                        .bold()
                                        .foregroundStyle(.black)
                                }
                                .padding()
                            }
                        }
                    )
            }
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
    FlashcardListView(deckType: .saved)
        .environmentObject(FlashcardViewModel())
}
