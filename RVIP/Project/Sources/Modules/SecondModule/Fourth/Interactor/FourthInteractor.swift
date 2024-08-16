//
//  FourthInteractor.swift
//  RVIP
//
//  Created by Александр Иванов on 13.06.2024.
//

import Foundation

//MARK: - Interfaces

protocol FourthBusinessLogicProtocol {
    func getData() async
    func startCounter() async
}

//MARK: - FourthInteractor

final class FourthInteractor {
    private var presenter: FourthPresentationLogicProtocol
    private var worker: FourthWorkerLogicProtocol
    private var data: FourthData?
    
    // MARK: - Initializers
    
    init(presenter: FourthPresentationLogicProtocol, worker: FourthWorkerLogicProtocol, data: FourthData? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.data = data
    }
}

//MARK: - FourthBusinessLogicProtocol

extension FourthInteractor: FourthBusinessLogicProtocol {
    func startCounter() async {
        do {
            let profileInfo = try await worker.getData()
            await presenter.dateRecieved(data: profileInfo)
        } catch {
            
        }
    }
    
    func getData() async {
        guard let data = data else { return }
        await presenter.presentData(data)
    }
}
