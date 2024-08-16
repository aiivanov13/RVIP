//
//  Localization.swift
//  RVIP
//
//  Created by Александр Иванов on 29.07.2024.
//

import Foundation

struct Localization: BaseLocalization {
    enum Buttons {
        static let fromViewTap = localize("fromViewTap")
        static let fromInteractorTapButton = localize("fromInteractorTapButton")
        static let button = localize("button")
        static let started = localize("started")
    }
}
