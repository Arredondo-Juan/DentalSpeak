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
            List {
                Section(header: Text("Phrases - Tap to hear translation")) {
                    ForEach(filteredPhrases) { flashcard in
                        ListItemView(term: flashcard.term, definition: flashcard.definition) {
                            viewModel.speak(flashcard.definition)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .navigationTitle("Phrases")
            .searchable(text: $searchText)
            .listStyle(PlainListStyle())
        }
    }
}
