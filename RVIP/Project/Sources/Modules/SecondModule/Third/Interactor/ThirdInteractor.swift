//
//  ThirdInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol ThirdBusinessLogicProtocol {
    func fetchData() async
}

//MARK: - ThirdInteractor

final actor ThirdInteractor {
    private var presenter: ThirdPresentationLogicProtocol
    private var worker: ThirdWorkerLogicProtocol
    private var data: ThirdData?
    
    // MARK: - Initializers
    
    init(presenter: ThirdPresentationLogicProtocol, worker: ThirdWorkerLogicProtocol,  data: ThirdData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - ThirdBusinessLogicProtocol

extension ThirdInteractor: ThirdBusinessLogicProtocol {
    func fetchData() async {
        let title = await worker.title
        await presenter.dataFetchingSuccess(title: title)
    }
}
