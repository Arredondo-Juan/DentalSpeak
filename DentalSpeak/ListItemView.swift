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
            VStack (alignment: .center) {
                Button (action: {
                    onSpeakerTap()
                }) {
                    Text(term)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 2)
                    Text(definition)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 80, alignment: .center)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .padding(.horizontal)
    }
}
