//
//  ServerLinks.swift
//  RVIP
//
//  Created by Александр Иванов on 20.08.2024.
//

import Foundation

// MARK: - ApiVersion

enum ServerLink {
    case rickandmorty
    
    var stringURL: String {
        switch self {
        case .rickandmorty:
            return "https://rickandmortyapi.com"
        }
    }
}
