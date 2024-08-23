//
//  CodeConfirmPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol CodeConfirmPresentationLogicProtocol {
    func dataFetchingSuccess(characters: GetCharacterResponse, locations: GetLocationResponse) async
    func dataLoadingSuccess(data: CodeConfirmData) async
}

//MARK: - CodeConfirmPresenter

final class CodeConfirmPresenter {
    weak var view: CodeConfirmDisplayLogicProtocol!
}

//MARK: - CodeConfirmPresentationLogicProtocol

extension CodeConfirmPresenter: CodeConfirmPresentationLogicProtocol {
    func dataLoadingSuccess(data: CodeConfirmData) async {
        view.displayData(data: data.phone)
    }
    
    func dataFetchingSuccess(characters: GetCharacterResponse, locations: GetLocationResponse) async {
        try? await Task.sleep(seconds: 1)
        
        view.stopLoader()
        view.coordinator?.toNextModule(with: MainTabBarData(characters: characters, locations: locations))
    }
}
