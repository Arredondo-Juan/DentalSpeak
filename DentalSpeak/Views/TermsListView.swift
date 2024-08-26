//
//  TermsListView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct TermsListView: View {
    @EnvironmentObject var viewModel: FlashcardViewModel
    @State private var searchText = ""
    
    var filteredTerms: [Flashcard] {
        viewModel.termsDeck
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
                        LazyVStack (spacing: 10) {
                            ForEach(filteredTerms) { flashcard in
                                ListItemView(term: flashcard.term, definition: flashcard.definition) {
                                    viewModel.speak(flashcard.definition)
                                }
                                .listRowSeparator(.hidden)
                            }
                        }
                    }
                }
                .onTapGesture {
                    dismissKeyboard()
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.white.opacity(0.2))
                .shadow(radius: 1, y: 1)
                .cornerRadius(20)
                .foregroundColor(.black)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        }
        .padding(.top, 8)
    }
}
