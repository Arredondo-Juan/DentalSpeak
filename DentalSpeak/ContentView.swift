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
                    Text("Terms")
                        .tag(0)
                    
                    Text("Phrases")
                        .tag(1)
                    
                    Text("Flashcards")
                        .tag(2)
                }
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("Terms")
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
}

#Preview {
    ContentView()
}
