//
//  ContentView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    TermsListView()
                        .tag(0)
                    
                    PhrasesListView()
                        .tag(1)
                    
                    FlashcardDecksView()
                        .tag(2)
                }
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle(currentTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color.black)
                    })
                }
            }
        }
    }
    
        private var currentTitle: String {
            switch selectedTab {
            case 0:
                return "Terms"
            case 1:
                return "Phrases"
            case 2:
                return "Flashcards"
            default:
                return "Terms"
            }
        }
}

#Preview {
    ContentView()
}
