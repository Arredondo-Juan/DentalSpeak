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
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 0)
                    .padding(.horizontal)
                
                Button(action: {
                    onSpeakerTap()
                }) {
                    Text(definition)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.subText)
                        .multilineTextAlignment(.center)
                        .padding(.top, 0)
                        .padding(.horizontal)
                }
            }
        }
        .padding(.top, 3)
        .padding(.bottom, 3)
        .frame(maxWidth: .infinity, minHeight: 40, alignment: .center)
        .background(Color.lightBlue)
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
