//
//  SideMenuOptionModel.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/9/24.
//

import Foundation

enum SideMenuOptionsModel: Int, CaseIterable {
    
    case terms
    case phrases
    case flashcards
//    case feedback
    
    var title: String {
        switch self {
        case .terms:
            return "Terms"
        case .phrases:
            return "Phrases"
        case .flashcards:
            return "Flashcards"
//        case .feedback:
//            return "dentalspeakapp@gmail.com"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .terms:
            return "book"
        case .phrases:
            return "text.word.spacing"
        case .flashcards:
            return "rectangle.stack"
//        case .feedback:
//            return "envelope"
        }
    }
}

extension SideMenuOptionsModel: Identifiable {
    var id: Int { return self.rawValue}
}
