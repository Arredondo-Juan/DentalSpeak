//
//  SideMenuSections.swift
//  DentalSpeak
//
//  Created by Juan Arredondo on 8/12/24.
//

import Foundation

enum SideMenuSections: Int, CaseIterable {
    case main
    case other
    
    var sectionTitle: String {
        switch self {
        case .main:
            return "Main"
        case .other:
            return "Other"
        }
    }
    
    var options: [SideMenuOptionsModel] {
        switch self {
        case .main:
            return [.terms, .phrases, .flashcards]
        case .other:
            return []
        }
    }
}

extension SideMenuSections: Identifiable {
    var id: Int { return self.rawValue }
}
