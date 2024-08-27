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
                    if deckType == .saved {
                        Text("No saved cards")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        Button {
                            loadFlashcards()
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
                        Text("Reload flashcards")
                            .foregroundColor(.mainText)
                            .bold()
                            .padding()
                    }
                } else {
                    if currentIndex < flashcards.count {
                        DraggableCardView(flashcards: $flashcards,
                                          flashcard: flashcards[currentIndex],
                                          isInSavedDeck: deckType == .saved)
                        .onDisappear {
                            currentIndex += 1
                        }
                        
                        HStack(alignment: .center) {
                            if deckType != .saved {
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
                                    loadFlashcards()
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
                            
                            Button {
                                toggleBookmark(flashcard: flashcards[currentIndex])
                            } label: {
                                Image(systemName: isFlashcardBookmarked(flashcard: flashcards[currentIndex]) ? "bookmark.fill" : "bookmark")
                                    .bold()
                                    .frame(width: 50)
                                    .padding()
                                    .foregroundColor(.mainText)
                                    .background(.lightBlue)
                                    .cornerRadius(100)
                            }
                        }
                        .padding()
                        
                        Text("Cards remaining: \(flashcards.count - currentIndex)")
                            .font(.headline)
                            .padding(.top)
                    } else {
                        if deckType == .saved {
                            Text("No saved cards")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            VStack {
                                Text("You've gone through all the cards!")
                                    .font(.headline)
                                    .padding()
                                
                                Button {
                                    loadFlashcards()
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
                                .padding(.top)
                            }
                        }
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
                                VStack {
                                    Text("Swipe through your saved flashcards.")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom, 40)
                                    
                                    Text("Remove them by tapping the bookmark button.")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                            } else {
                                // Terms/Phrases Deck Overlay Content
                                VStack {
                                    Text("Swipe on the flashcard to go to the next one.")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .padding(.bottom, 40)
                                    
                                    Text("Change the order, save, or reload the flashcards!")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
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
            currentIndex = 0
        case .phrases:
            flashcards = viewModel.phrasesDeck
            currentIndex = 0
        case .saved:
            flashcards = viewModel.savedDeck
        }
    }
    
    private func toggleBookmark(flashcard: Flashcard) {
        if viewModel.isFlashcardSaved(flashcard) {
            viewModel.removeFlashcard(flashcard)
            flashcards.removeAll { $0.id == flashcard.id }
        } else {
            viewModel.saveFlashcard(flashcard)
        }
    }
    
    private func isFlashcardBookmarked(flashcard: Flashcard) -> Bool {
        return viewModel.isFlashcardSaved(flashcard)
    }
}


#Preview {
    FlashcardListView(deckType: .saved)
        .environmentObject(FlashcardViewModel())
}
