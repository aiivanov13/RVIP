//
//  ThirdPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol ThirdPresentationLogicProtocol {
    func dataFetchingSuccess(title: String) async
}

//MARK: - ThirdPresenter

final class ThirdPresenter {
    weak var view: ThirdDisplayLogicProtocol!
}

//MARK: - ThirdPresentationLogicProtocol

extension ThirdPresenter: ThirdPresentationLogicProtocol {
    func dataFetchingSuccess(title: String) async {
        view.updateBackgroundColor()
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        view.coordinator?.toFourth(with: FourthData(title: title))
    }
}
