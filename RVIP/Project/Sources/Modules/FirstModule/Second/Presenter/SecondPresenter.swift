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
    func cycleStarted()
    func cycleFinished()
}

//MARK: - SecondPresenter

final class SecondPresenter {
    weak var view: SecondDisplayLogicProtocol?
}

//MARK: - SecondPresentationLogicProtocol

extension SecondPresenter: SecondPresentationLogicProtocol {
    func cycleFinished() {
        view?.onCycleFinished()
        view?.coordinator?.toNextModule(with: ThirdData(title: "nextModule"))
    }
    
    func cycleStarted() {
        view?.onCycleStarted()
    }
    
    func presentData(_ data: SecondData) {
        view?.displayData(title: data.title)
    }
}
