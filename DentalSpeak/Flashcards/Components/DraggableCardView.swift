//
//  DraggableCardView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct DraggableCardView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @Binding var flashcards: [Flashcard]
    var flashcard: Flashcard
    @State private var offset: CGSize = .zero
    @State private var showingTerm = true
    var isInSavedDeck: Bool
    
    var body: some View {
        VStack {
            if showingTerm {
                Text(flashcard.term)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.mainText)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 300, height: 180)
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.lightBlue)
                        .shadow(radius: 5, y: 5))
            } else {
                VStack {
                    Text(flashcard.definition)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.mainText)
                        .multilineTextAlignment(.center)
                        .padding()
                    PlaybackButton(text: flashcard.definition)
                }
                .frame(width: 300, height: 180)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(Color.lightBlue)
                    .shadow(radius: 5, y: 5))
            }
        }
        .offset(offset)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        withAnimation(.easeInOut) {
                            if isInSavedDeck {
                                // Move to the back of the saved deck
                                flashcards.removeAll { $0.id == flashcard.id }
                                flashcards.append(flashcard)
                            } else {
                                // Dismiss the card
                                flashcards.removeAll { $0.id == flashcard.id }
                            }
                            self.offset = .zero
                        }
                    } else {
                        withAnimation(.spring()) {
                            self.offset = .zero
                        }
                    }
                }
        )
        .onTapGesture {
            withAnimation {
                showingTerm.toggle()
            }
        }
    }
}
