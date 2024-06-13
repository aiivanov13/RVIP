//
//  SecondPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces
@MainActor
protocol SecondPresentationLogicProtocol {
    func presentData(_ data: SecondData)
}

//MARK: - SecondPresenter
final class SecondPresenter {
    weak var view: SecondDisplayLogicProtocol!
    weak var router: SecondPassDataLogicProtocol!
}

//MARK: - SecondPresentationLogicProtocol
extension SecondPresenter: SecondPresentationLogicProtocol {
    func presentData(_ data: SecondData) {
        view.displayData(title: data.title)
    }
}
