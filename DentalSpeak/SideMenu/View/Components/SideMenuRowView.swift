//
//  SideMenuRowView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionsModel
    @Binding var selectedOption: SideMenuOptionsModel?
    
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
        .foregroundStyle(Color.black)
        .frame(width: 216, height: 44)
        .background(isSelected ? .menuSelection : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SideMenuRowView(option: .terms, selectedOption: .constant(.terms))
}
