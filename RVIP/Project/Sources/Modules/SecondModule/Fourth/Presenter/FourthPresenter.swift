//
//  FourthPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol FourthPresentationLogicProtocol {
    func presentData(_ data: FourthData)
    func dateRecieved(data: ProfileInfo)
}

//MARK: - FourthPresenter

final class FourthPresenter {
    weak var view: FourthDisplayLogicProtocol?
}

//MARK: - FourthPresentationLogicProtocol

extension FourthPresenter: FourthPresentationLogicProtocol {
    func dateRecieved(data: ProfileInfo) {
        view?.displayData(title: data.phone)
        
        Task { [weak self] in
            
            try await Task.sleep(seconds: 2)
            self?.view?.coordinator?.back(animated: true)
        }
    }
    
    func presentData(_ data: FourthData) {
        view?.displayData(title: data.title)
    }
}
