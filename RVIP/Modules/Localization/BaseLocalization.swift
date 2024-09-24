//
//  BaseLocalization.swift
//  RVIP
//
//  Created by Александр Иванов on 31.07.2024.
//

import Foundation

protocol BaseLocalization {
    static func localize(_ id: String.LocalizationValue) -> String
}

extension BaseLocalization {
    static func localize(_ id: String.LocalizationValue) -> String {
        return String(localized: id, table: String(describing: self))
    }
}
