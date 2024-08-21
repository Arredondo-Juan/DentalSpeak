//
//  ContentView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedMenuOption: SideMenuOptionsModel?
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                if let selectedOption = selectedMenuOption {
                    navigationDestination(for: selectedOption)
                        .transition(.slide)
                } else {
                    TermsListView()
                        .transition(.slide)
                }
                
                SideMenuView(isShowing: $showMenu, selectedOption: $selectedMenuOption)
            }
            .navigationTitle(selectedMenuOption == nil ? "Terms" : title(for: selectedMenuOption!))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            .onChange(of: selectedMenuOption) {
                showMenu = false
            }
        }
    }
}

private extension ContentView {
    func navigationDestination(for option: SideMenuOptionsModel) -> some View {
        switch option {
        case .terms:
            return AnyView(TermsListView())
        case .phrases:
            return AnyView(PhrasesListView())
        case .flashcards:
            return AnyView(FlashcardDecksView())
//        case .feedback:
//            return AnyView(FeedbackFormView())
            
        }
    }
    
    func title(for option: SideMenuOptionsModel) -> String {
        switch option {
        case .terms:
            return "Terms"
        case .phrases:
            return "Phrases"
        case .flashcards:
            return "Flashcards"
//        case .feedback:
//            return "Submit Feedback"
        }
    }
}

#Preview {
    ContentView()
}
