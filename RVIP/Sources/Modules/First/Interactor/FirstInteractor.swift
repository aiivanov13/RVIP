//
//  FirstInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces
protocol FirstBusinessLogicProtocol {
    func fetchData() async
}

//MARK: - FirstInteractor
final actor FirstInteractor {
    private var presenter: FirstPresentationLogicProtocol
    private var worker: FirstWorkerLogicProtocol
    private var data: FirstData?
    
    // MARK: - Initializers
    init(presenter: FirstPresentationLogicProtocol, worker: FirstWorkerLogicProtocol,  data: FirstData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - FirstBusinessLogicProtocol
extension FirstInteractor: FirstBusinessLogicProtocol {
    func fetchData() async {
        let title = await worker.title
        await presenter.dataFetchingSuccess(title: title)
    }
}
