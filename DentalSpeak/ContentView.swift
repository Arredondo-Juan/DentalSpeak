//
//  ContentView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    // MARK: Main body for view
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                
                SideMenuView(isShowing: $showMenu)
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
