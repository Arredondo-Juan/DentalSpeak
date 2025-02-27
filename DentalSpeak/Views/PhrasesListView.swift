//
//  PhrasesListView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct PhrasesListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @State private var searchText = ""
    
    var filteredPhrases: [Flashcard] {
        viewModel.phrasesDeck
            .filter { $0.term.localizedCaseInsensitiveContains(searchText) || searchText.isEmpty }
            .sorted { $0.term.localizedCompare($1.term) == .orderedAscending }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(.lightBlue), Color(.darkGreen)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    // Custom Search Bar
                    SearchBar(text: $searchText)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(filteredPhrases) { flashcard in
                                ListItemView(
                                    term: flashcard.term,
                                    definition: flashcard.definition,
                                    isFavorited: viewModel.isFlashcardFavorited(flashcard)) {
                                        viewModel.speak(flashcard.definition)
                                    } onFavoriteTap: {
                                        viewModel.toggleFavorite(flashcard)
                                    }
                                    .listRowSeparator(.hidden)
                            }
                        }
                    }
                }
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
