//
//  SideMenuRowView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            Text(option.title)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width: 216, height: 44)
        .background(isSelected ? .gray.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    SideMenuRowView(option: .flashcards, selectedOption: .constant(.flashcards))
}
