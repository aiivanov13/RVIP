//
//  Location.swift
//  RVIP
//
//  Created by Александр Иванов on 23.08.2024.
//

import Foundation

struct RMLocationInfoModel: Codable {
    let info: Info
    let results: [RMLocationModel]
}

struct RMLocationModel: Codable, Identifiable  {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
