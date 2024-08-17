//
//  ListItemView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct ListItemView: View {
    
    var term: String
    var definition: String
    var onSpeakerTap: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                
                Text(term)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                Button(action: {
                    onSpeakerTap()
                }) {
                    Text(definition)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.subText)
                        .multilineTextAlignment(.center)
                        .padding(.top, 0)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 80, alignment: .center)
        .background(Color.lightBlueee)
        .modifier(CardModifier())
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(radius: 1, y: 1)
            .padding(.horizontal)
    }
}
