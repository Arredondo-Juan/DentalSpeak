//
//  HomeView.swift
//  SideMenuTemplate
//
//  Created by Stephan Dowless on 1/17/24.
//

import SwiftUI

struct MainTabbedView: View {
    @State private var selectedTab = 0
    @State private var showSideMenu = false
    @State private var selectedOption: SideMenuOptionsModel? = .terms
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    ForEach(SideMenuOptionsModel.allCases) { option in
                        switch option {
                        case .terms:
                            TermsListView()
                                .tag(option.rawValue)
                        case .phrases:
                            PhrasesListView()
                                .tag(option.rawValue)
                        case .flashcards:
                            FlashcardDecksView()
                                .tag(option.rawValue)
                      
                        }
                    }
                }
                
                SideMenuView(isShowing: $showSideMenu, selectedOption: $selectedOption)
            }
            .navigationTitle(selectedOption?.title ?? "Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(showSideMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showSideMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.primary)
                    }
                }
            }
            .onChange(of: selectedOption) { oldValue, newValue in
                guard let newValue else { return }
                selectedTab = newValue.rawValue
            }
        }
    }
}

#Preview {
    MainTabbedView()
}
