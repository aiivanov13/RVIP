//
//  CharactersPresenter.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

@MainActor
protocol CharactersPresentationLogicProtocol {
    func dataLoaded(_ data: CharactersData) async
}

//MARK: - CharactersPresenter

final class CharactersPresenter {
    weak var view: CharactersDisplayLogicProtocol?
}

//MARK: - CharactersPresentationLogicProtocol

extension CharactersPresenter: CharactersPresentationLogicProtocol {
    func dataLoaded(_ data: CharactersData) async {
        let cellData = data.characters.results.map {
            CharacterCell.Data(name: $0.name, status: $0.status, image: $0.image)
        }
        
        let displayData: [CharacterSection] = [.character(data: cellData)]
        
        view?.displayData(displayData)
    }
}
