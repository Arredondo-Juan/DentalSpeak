//
//  FlashcardDecksView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct FlashcardDecksView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(.lightBlue), Color(.darkGreen)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(spacing: 25) {
                    ForEach(DeckType.allCases, id: \.self) { deckType in
                        NavigationLink(destination: FlashcardListView(deckType: deckType)) {
                            Text(deckType.rawValue)
                        }
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.mainText)
                        .frame(width: 300, height: 180)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .fill(Color.lightBlue)
                            .shadow(radius: 5, y: 5))
                    }
                }
                //                .navigationTitle("Flashcards")
                //                .navigationBarTitleDisplayMode(.large)
                //                .padding()
            }
        }
    }
}

#Preview {
    FlashcardDecksView()
}
