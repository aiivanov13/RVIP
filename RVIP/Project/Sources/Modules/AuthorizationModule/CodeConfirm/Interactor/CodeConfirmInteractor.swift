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
    private var presenter: CodeConfirmPresentationLogicProtocol
    private var worker: CodeConfirmWorkerLogicProtocol
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
        guard let characters = await worker.getCharacters() else { return }
        guard let locations = await worker.getLocations() else { return }
        
        await presenter.dataFetchingSuccess(characters: characters, locations: locations)
    }
}
