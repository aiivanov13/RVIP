//
//  CharactersWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol CharactersWorkerLogicProtocol {

}

//MARK: - CharactersWorker

final actor CharactersWorker {
    private var network = AsyncHttpJsonClient()
}

//MARK: - CharactersWorkerLogicProtocol

extension CharactersWorker: CharactersWorkerLogicProtocol {

}
