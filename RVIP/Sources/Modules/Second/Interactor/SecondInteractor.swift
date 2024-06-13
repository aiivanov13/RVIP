//
//  SecondInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces
protocol SecondBusinessLogicProtocol {
    func getData() async
}

//MARK: - SecondInteractor
final actor SecondInteractor {
    private var presenter: SecondPresentationLogicProtocol
    private var worker: SecondWorkerLogicProtocol
    private var data: SecondData?
    
    // MARK: - Initializers
    init(presenter: SecondPresentationLogicProtocol, worker: SecondWorkerLogicProtocol,  data: SecondData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - SecondBusinessLogicProtocol
extension SecondInteractor: SecondBusinessLogicProtocol {
    func getData() async {
        guard let data = data else { return }
        await presenter.presentData(data)
    }
}
