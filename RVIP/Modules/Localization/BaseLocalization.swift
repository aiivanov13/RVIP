//
//  BaseLocalization.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import Foundation

protocol BaseLocalization {
    static func localize(_ id: String) -> String
}

extension BaseLocalization {
    static func localize(_ id: String) -> String {
        NSLocalizedString(id, bundle: .main, comment: "")
    }
}
