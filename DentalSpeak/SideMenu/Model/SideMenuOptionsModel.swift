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
    case favorites
    case flashcards
    
    var title: String {
        switch self {
        case .terms:
            return "Terms"
        case .phrases:
            return "Phrases"
        case .favorites:
            return "Favorites"
        case .flashcards:
            return "Flashcards"
            
        }
    }
    
    var systemImageName: String {
        switch self {
        case .terms:
            return "book"
        case .phrases:
            return "text.word.spacing"
        case .favorites:
            return "star.fill"
        case .flashcards:
            return "rectangle.stack"
        }
    }
}

extension SideMenuOptionsModel: Identifiable {
    var id: Int { return self.rawValue}
}
