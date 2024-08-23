//
//  Character.swift
//  RVIP
//
//  Created by Александр Иванов on 21.08.2024.
//

import Foundation

struct RMCharacterInfoModel: Codable {
    let info: Info
    let results: [RMCharacterModel]
}

struct RMCharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: String
    let origin: RMCharacterOriginModel
    let location: RMCharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct RMCharacterOriginModel: Codable {
    let name: String
    let url: String
}

struct RMCharacterLocationModel: Codable {
    let name: String
    let url: String
}

enum CharacterStatus: String, Codable {
    case Alive, Dead, unknown
}
