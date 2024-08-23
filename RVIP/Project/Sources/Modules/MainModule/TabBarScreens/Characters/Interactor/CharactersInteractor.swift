//
//  CharactersInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol CharactersBusinessLogicProtocol {
    func fetchData() async
}

//MARK: - CharactersInteractor

final class CharactersInteractor {
    private var presenter: CharactersPresentationLogicProtocol
    private var worker: CharactersWorkerLogicProtocol
    private var data: CharactersData?
    
    // MARK: - Initializers
    
    init(presenter: CharactersPresentationLogicProtocol, worker: CharactersWorkerLogicProtocol, data: CharactersData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - CharactersBusinessLogicProtocol

extension CharactersInteractor: CharactersBusinessLogicProtocol {
    func fetchData() async {
        guard let data = data else { return }
        await presenter.dataLoaded(data)
    }
}
