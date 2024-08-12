//
//  SideMenuSectionView.swift
//  SideMenuTemplate
//
//  Created by Stephan Dowless on 1/17/24.
//

import SwiftUI

struct SideMenuSectionView: View {
    @Binding var isShowing: Bool
    @Binding var selectedOption: SideMenuOptionsModel?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
     
            
        }
    }
    
    private func onOptionTapped(_ option: SideMenuOptionsModel) {
        selectedOption = option
        isShowing = false
    }
}

#Preview {
    SideMenuSectionView(isShowing: .constant(false),
                        selectedOption: .constant(.terms))
}
