//
//  CodeConfirmInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol CodeConfirmBusinessLogicProtocol {
    func loadData() async
    func fetchData() async
}

//MARK: - CodeConfirmInteractor

final actor CodeConfirmInteractor {
    private let presenter: CodeConfirmPresentationLogicProtocol
    private let worker: CodeConfirmWorkerLogicProtocol
    private var data: CodeConfirmData?
    
    // MARK: - Initializers
    
    init(presenter: CodeConfirmPresentationLogicProtocol, worker: CodeConfirmWorkerLogicProtocol, data: CodeConfirmData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - CodeConfirmBusinessLogicProtocol

extension CodeConfirmInteractor: CodeConfirmBusinessLogicProtocol {
    func loadData() async {
        guard let data = data else { return }
        await presenter.dataLoadingSuccess(data: data)
    }
    
    func fetchData() async {
        do {
            let characters = try await worker.getCharacters()
            let locations = try await worker.getLocations()
            
            await presenter.dataFetchingSuccess(characters: characters, locations: locations)
        } catch {
            print("ошибка \(error)")
        }
    }
}
