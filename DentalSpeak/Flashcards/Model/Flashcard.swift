//
//  Flashcard.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/10/24.
//

import Foundation

struct Flashcard: Identifiable, Codable, Equatable {
    var id = UUID()
    var term: String
    var definition: String
    
    enum CodingKeys: String, CodingKey {
        case term
        case definition
    }
}

struct FlashcardData: Codable {
    var termsDeck: [Flashcard]
    var phrasesDeck: [Flashcard]
}
