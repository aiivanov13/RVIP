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
    func dataFetchingSuccess(title: String) async
}

//MARK: - FirstPresenter

final class FirstPresenter {
    weak var view: FirstDisplayLogicProtocol!
}

//MARK: - FirstPresentationLogicProtocol

extension FirstPresenter: FirstPresentationLogicProtocol {
    func dataFetchingSuccess(title: String) async {
        view.updateBackgroundColor()
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        view.coordinator?.toSecond(with: SecondData(title: title))
    }
}
