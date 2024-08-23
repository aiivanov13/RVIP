//
//  Info.swift
//  RVIP
//
//  Created by Александр Иванов on 21.08.2024.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
