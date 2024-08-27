//
//  FavoritesListView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/26/24.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @State private var searchText = ""
    
    var filteredFavorites: [Flashcard] {
        viewModel.favoritesDeck
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
                    
                    if filteredFavorites.isEmpty {
                        Spacer()
                        Text("No favorites added")
                            .foregroundColor(.gray)
                            .padding()
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 10) {
                                ForEach(filteredFavorites) { flashcard in
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
