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
                VStack {
                    TermsListView()
                }
                
                SideMenuView(isShowing: $showMenu, selectedOption: $selectedMenuOption)
            }
            .navigationDestination(for: SideMenuOptionsModel.self, destination: { option in
                navigationDestination(for: option)
            })
            .onAppear { showMenu = false }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
    }
}

private extension ContentView {
    func navigationDestination(for option: SideMenuOptionsModel) -> AnyView {
        switch option {
        case .terms:
            AnyView(TermsListView())
        case .phrases:
            AnyView(PhrasesListView())
        case .flashcards:
            AnyView(FlashcardDecksView())
        }
    }
}

#Preview {
    ContentView()
}
