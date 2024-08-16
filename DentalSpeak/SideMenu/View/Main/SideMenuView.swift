//
//  SideMenuView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedOption: SideMenuOptionsModel?

    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        VStack {
                            ForEach(SideMenuSections.allCases) { section in
                                SideMenuSectionView(section: section,
                                                    isShowing: $isShowing,
                                                    selectedOption: $selectedOption)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(LinearGradient(colors: [Color(.lightBlue), Color(.white)],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    private func onOptionTapped(_ option: SideMenuOptionsModel) {
        selectedOption = option
        isShowing = false
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedOption: .constant(.terms))
}
