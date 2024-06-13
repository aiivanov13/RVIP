//
//  FirstPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces
@MainActor
protocol FirstPresentationLogicProtocol {
    func dataFetchingSuccess(title: String)
}

//MARK: - FirstPresenter
final class FirstPresenter {
    weak var view: FirstDisplayLogicProtocol!
    weak var router: FirstPassDataLogicProtocol!
}

//MARK: - FirstPresentationLogicProtocol
extension FirstPresenter: FirstPresentationLogicProtocol {
    func dataFetchingSuccess(title: String) {
        router.pushSecondWithData(
            data: SecondData(title: title)
        )
    }
}
