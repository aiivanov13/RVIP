//
//  CodeConfirmWorker.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol CodeConfirmWorkerLogicProtocol {
    func getCharacters() async throws -> GetCharacterResponse
    func getLocations() async throws -> GetLocationResponse
}

//MARK: - CodeConfirmWorker

final actor CodeConfirmWorker {
    private var userSession: UserSessionProtocol
    
    init(userSession: UserSessionProtocol) {
        self.userSession = userSession
    }
}

//MARK: - CodeConfirmWorkerLogicProtocol

extension CodeConfirmWorker: CodeConfirmWorkerLogicProtocol {
    func getLocations() async throws -> GetLocationResponse {
        try await userSession.networkClient.get(path: "api/location")
    }
    
    func getCharacters() async throws -> GetCharacterResponse {
        try await userSession.networkClient.get(path: "/api/character")
    }
}
