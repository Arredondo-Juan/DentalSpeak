//
//  SideMenuSectionView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/12/24.
//

import SwiftUI

struct SideMenuSectionView: View {
    let section: SideMenuSections
    @Binding var isShowing: Bool
    @Binding var selectedOption: SideMenuOptionsModel?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(section.sectionTitle.uppercased())
                .padding(.leading)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.vertical)
            
            ForEach(section.options, id: \.id) { option in
                
                NavigationLink(value: option) {
                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                }
                .simultaneousGesture(TapGesture().onEnded({
                    onOptionTapped(option)
                }))
                
            }
        }
    }
    
    private func onOptionTapped(_ option: SideMenuOptionsModel) {
        selectedOption = option
        isShowing = false
    }
}

#Preview {
    SideMenuSectionView(section: .main,
                        isShowing: .constant(false),
                        selectedOption: .constant(.terms))
}
