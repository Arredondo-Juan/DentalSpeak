//
//  FlashcardView.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import SwiftUI

struct FlashcardView: View {
    var flashcard: Flashcard
    @State private var isFlipped = false
    
    var body: some View {
        VStack {
            if isFlipped {
                Text(flashcard.definition)
                    .font(.headline)
                    .padding()
            } else {
                Text(flashcard.term)
                    .font(.headline)
                    .padding()
            }
        }
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    FlashcardView(flashcard: Flashcard(term: "Crown", definition: "Corona"))
}
