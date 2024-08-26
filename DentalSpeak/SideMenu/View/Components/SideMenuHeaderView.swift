//
//  SideMenuHeaderView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image("tooth-sparkle")
                .resizable()
                .imageScale(.large)
                .frame(width: 48, height: 48)
                .shadow(radius: 1, y:1)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("DentalSpeak")
                    .font(.headline)
                
                Text("Dental terms in Spanish")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
